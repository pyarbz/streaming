class DetailIndex
  #rootのパス
  ROOT_PATH = '/'

  def self.create_index(param_data)
    this_params = {
      path: param_data[:path],
      list: true,
      file_limit: 10000,
      include_deleted: false,
      depth: 1
    }

    data = DropboxHelper.get_fileList(this_params)

    # APIから取得できなかったらfalse
    return false if data[:request] == false

    # folderだった場合の処理
    if data[:is_dir]

      # Rootであるときの処理
      if data[:path] == ROOT_PATH
        dropbox_modified_at = Time.zone.now
        path_name = 'root'
        is_root = true

      else
        dropbox_modified_at = DateTime.strptime(data[:modified], '%a, %d %b %Y %T %z')
        .in_time_zone
        path_name = data[:path].split('/').last
        is_root = false

      end

      # DropboxAPIのpathlistを作成
      dropbox_lists = PathObject.dropbox_path_lists(data)

      # Detailのpathlistを作成
      detail_lists = PathObject.path_and_id_lists(data)

      # detail idを宣言
      this_detail_id = nil

      # Dropboxになくて閉包テーブルに存在するものを削除
      # DestroyObject.destroy_detail(dropbox_lists, detail_lists)

      # detailがhashとして存在する場合
      if (this_folder = DetailFolder.find_by(folder_hash: data[:hash])).present?
        # 時間のみ更新する
        this_detail_id = this_folder.detail_id
        update_detail = Detail.find(this_folder.detail_id)
        update_detail.dropbox_modified_at = dropbox_modified_at
        update_detail.save!

      # detailがhashとして存在しなく、pathが存在する場合
      elsif detail_lists[:pathlist].include?(data[:path])
        detail_lists[:path_id_maps].each do |detail|
          this_detail_id = detail[:id] if detail[:path] == data[:path]
        end
        # 時間のみ更新する
        update_detail = Detail.find(this_detail_id)
        update_detail.dropbox_modified_at = dropbox_modified_at
        update_detail.save!

      else #detailが生成されていない場合、そのまま生成する
        # detailの作成
        detail = Detail.new(
          path: path_name,
          is_dir: data[:is_dir],
          is_root: is_root,
          dropbox_modified_at: dropbox_modified_at,
          size: data[:size]
        )

        # 子を持っていたらtrue
        detail[:have_child] = if data[:contents].present?
                                true
                              else
                                false
                              end
        detail.save!


        # 親のIDの指定
        # rootの場合、自分自身のIDを渡す
        parent_id = if param_data[:parent_id] == nil
                      detail.id
                    else
                      param_data[:parent_id]
                    end


        # 自分自身をpathに設定
        closure = DetailClosure.new(
          depth: 0,
          ancestor_detail_id: detail.id,
          descendant_detail_id: detail.id
        )
        closure.save!

        # 挿入する親ノードのIDを子として持つ、全てのIDを取得し、それらに自分自身のIDを関連付ける
        unless parent_id == detail.id
          ancestors = DetailClosure.where(descendant_detail_id: parent_id)
          .order(:ancestor_detail_id)
          .reverse_order
          .pluck(:ancestor_detail_id)

          ancestors.each_with_index do |ancestor, index|
            depth = index + 1
            closure = DetailClosure.new(
              depth: depth,
              ancestor_detail_id: ancestor,
              descendant_detail_id: detail.id
            )
            closure.save!
          end
        end

        # フォルダの処理
        folder = DetailFolder.new(
          name: path_name,
          folder_hash: data[:hash],
          detail_id: detail.id
        )
        folder.save!

        this_detail_id = detail.id
      end

      #子を持つ場合、再帰で呼び出す
      if data[:contents].present?#detail[:have_child]
        data[:contents].each do |content|

          # ディレクトリだった場合、再帰
          if content[:is_dir]
            param_data[:path] = content[:path]
            param_data[:parent_id] = this_detail_id#detail.id
            create_index(param_data)
          else #ファイルだった場合、そのまま登録
            dropbox_modified_at = DateTime.strptime(content[:modified], '%a, %d %b %Y %T %z')
            .in_time_zone
            path_name = content[:path].split('/').last
            file_modified_at = DateTime.strptime(content[:client_mtime], '%a, %d %b %Y %T %z')
            .in_time_zone


            # 子のdetail idを宣言
            child_detail_id = nil

            # detailに作成されていない場合のみ、作成する。
            if detail_lists[:pathlist].include?(content[:path])
              detail_lists[:path_id_maps].each do |detail|
                child_detail_id = detail[:id] if detail[:path] == content[:path]
              end
              # 時間のみ更新する
              update_detail = Detail.find(child_detail_id)
              update_detail.dropbox_modified_at = dropbox_modified_at
              update_detail.file.file_modified_at = file_modified_at
              update_detail.save!
            else
              # detailの作成
              child_detail = Detail.new(
                path: path_name,
                is_dir: content[:is_dir],
                is_root: false,
                dropbox_modified_at: dropbox_modified_at,
                size: content[:size],
                have_child: false
              )
              child_detail.save!

              # 親のIDの指定
              parent_id = this_detail_id

              # 自分自身をpathに設定
              closure = DetailClosure.new(
                depth: 0,
                ancestor_detail_id: child_detail.id,
                descendant_detail_id: child_detail.id
              )
              closure.save!

              # 挿入する親ノードのIDを子として持つ、全てのIDを取得し、それらに自分自身のIDを関連付ける
              unless parent_id == child_detail.id
                ancestors = DetailClosure.where(descendant_detail_id: parent_id)
                .order(:ancestor_detail_id)
                .reverse_order
                .pluck(:ancestor_detail_id)

                ancestors.each_with_index do |ancestor, index|
                  depth = index + 1
                  closure = DetailClosure.new(
                    depth: depth,
                    ancestor_detail_id: ancestor,
                    descendant_detail_id: child_detail.id
                  )
                  closure.save!
                end
              end


              medium = Medium.find_or_create_by(name: 'other')

              mimetype = if Mimetype.exists?(name: content[:mimetype])
                           Mimetype.find_by(name: content[:mimetype])
                         else
                           Mimetype.create(name: content[:mimetype], medium_id: medium.id)
                         end

              extension = if Extension.exists?(name: content[:extension])
                            Extension.find_by(name: content[:extension])
                          else
                            Extension.create(name: content[:extension], medium_id: medium.id)
                          end

              file = DetailFile.new(
                name: path_name,
                file_modified_at: file_modified_at,
                mimetype_id: mimetype.id,
                extension_id: extension.id,
                detail_id: child_detail.id
              )
              file.save!
            end
          end
        end
      end
    end

    return true
  end

end

