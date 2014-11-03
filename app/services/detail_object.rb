class DetailObject

  #rootのパス
  ROOT_PATH = '/'

  def self.create_this(param_data)
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
          .reverse_order.pluck(:ancestor_detail_id)

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

      #子を持つ場合、再帰で呼び出す
      if detail[:have_child]
        data[:contents].each do |content|

          # ディレクトリだった場合、再帰
          if content[:is_dir]
            param_data[:path] = content[:path]
            param_data[:parent_id] = detail.id
            create_this(param_data)
          else #ファイルだった場合、そのまま登録

            dropbox_modified_at = DateTime.strptime(content[:modified], '%a, %d %b %Y %T %z')
            .in_time_zone
            path_name = content[:path].split('/').last

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
            parent_id = detail.id

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
              .reverse_order.pluck(:ancestor_detail_id)

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

            # 時間をstringからtimezoneに変換
            file_modified_at = DateTime.strptime(content[:client_mtime], '%a, %d %b %Y %T %z')
            .in_time_zone

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

    return true
  end


  # rootの情報を取得してjsonを作成するメソッド
  def self.get_root
    root = Detail.where('details.is_root = true')
    root_info = get_detail_info(root)
    return root_info.to_json
  end

  # IDの情報を取得してjsonを作成するメソッド
  # SQLインジェクション対策済み
  def self.get_object(params)

    # デフォルトはfalse
    object_info = {request: false}

    # idを与えられなかったらfalse
    return object_info.to_json if params[:id].blank?

    # idが整数値か判断
    id_is_true = ApiHelper.integer_string?(params[:id])

    # 整数値だった場合のみ、DBから探す
    # 整数値じゃなかった場合はfalse
    if id_is_true
      object = Detail.where('details.id = ?', "#{params[:id]}")
    else
      return object_info.to_json
    end

    # テーブルに見つからなかったらfalse
    return object_info.to_json if object.blank?

    # テーブルに見つかったら情報を取得
    object_info = get_detail_info(object)
    return object_info.to_json
  end


  # detailの自分、親子情報をhashで返すメソッド
  # detail: Detail以外は受け付けない。detailじゃなかったらnilを返す
  def self.get_detail_info(detail)

    return nil unless detail.class == Detail::ActiveRecord_Relation
    this_info = {
      current: nil,
      parent: nil,
      child: nil,
      request: true
    }

    # 自分自身の情報を取得
    detail.find_each do |current|
      this_hash = generate_object_hash(current)
      this_info[:current] = this_hash
    end


    # root以外は親を取得
    unless this_info[:current][:is_root]
      # DBから取得
      parents = get_parents(detail, 1)
      parents.find_each do |parent|
        this_hash = generate_object_hash(parent)
        this_info[:parent] = this_hash
      end
    end

    # ディレクトリが子を持つ場合は子を取得
    if this_info[:current][:have_child]
      this_info[:child] = []
      # DBから取得
      childs = get_childs(detail, 1)
      childs.find_each do |child|
        this_hash = generate_object_hash(child)
        this_info[:child].push(this_hash)
      end
    end

    return this_info
  end

  # 親を取得するメソッド
  # current: whereで与えた値(classはDetail::ActiveRecord_Relation)
  # depth: どの分上の親まで取得するか
  def self.get_parents(current, depth)
    return nil unless current.class == Detail::ActiveRecord_Relation

    current.joins(:descendant_relations => :ancestor_relationship)
           .where(['detail_closures.depth >= ? and detail_closures.depth <= ?', 1, depth])
           .select('ancestor_relationships_detail_closures.*')
  end

  # 子を取得するメソッド
  # current: whereで与えた値(classはDetail::ActiveRecord_Relation)
  # depth: どの分下の子まで取得するか
  def self.get_childs(current, depth)
    return nil unless current.class == Detail::ActiveRecord_Relation

    current.joins(:ancestor_relations => :descendant_relationship)
           .where(['detail_closures.depth >= ? and detail_closures.depth <= ?', 1, depth])
           .select('descendant_relationships_detail_closures.*')
  end


  # pathを探す。見つかったらtrue
  # @param [String] path
  # @return [boolean]
  def self.path_exists?(path)

    path_array = path.split('/')
    path_name = path_array.last
    path_height = path_array.size


    # details.pathに同じ名前が存在するか確認する
    detail = Detail.where('details.path = ?', path_name)




    detail.joins(:descendant_relations => :ancestor_relationship)
          .where('detail_closures.ancestor_detail_id = ?', 1)
          .where('detail_closures.ancestor_detail_id = ?', 1)
          .select('ancestor_relationships_detail_closures.*')

    true
  end

  # idのパスを文字列で返すメソッド
  # 見つからなければnilを返す
  # 見つかったらstringで返す
  # @param [Integer] detail_id
  # @return [String]
  def self.generate_path(detail_id)

    detail = Detail.where('details.id = ?', detail_id)

    # idが見つからなかったらnullを返す
    return nil if detail.blank?

    path_array = detail.joins(:descendant_relations => :ancestor_relationship)
    .order('detail_closures.depth').reverse_order
    .pluck('ancestor_relationships_detail_closures.path')

    this_path = ROOT_PATH

    if this_path[-1] == '/'
      this_path = this_path.chop
    end

    # return this_path
    path_array.each_with_index do |path, index|
      unless index == 0
        this_path += '/' + path
      end
    end

    return this_path
  end

  # detailのdownloadできるpathを作成して返すメソッド
  # detail_id: Detailのid(integer)
  # 返り値: Dropboxから取得できるURL(string)
  def self.download_path(detail_id)

    this_path = generate_path(detail_id)

    # return this_path
    this_params = {
      path: this_path
    }

    this_path = DropboxHelper.get_fileURL(this_params)

    return this_path[:url]
  end

  # detailの情報をhashで作成して返すメソッド
  # detail: Detail以外は受け付けない。detailじゃなかったらnilを返す
  def self.generate_object_hash(detail)
    return nil unless detail.class == Detail
    this_hash = {
      id: detail.id,
      is_root: detail.is_root,
      is_dir: detail.is_dir,
      have_child: detail.have_child,
      size: detail.size,
      high_definition: detail.high_definition,
      blu_ray: detail.blu_ray,
      onair: detail.onair,
      movie: detail.movie,
      ova: detail.ova,
      complete: detail.complete,
      dropbox_modified_at: detail.dropbox_modified_at,
      created_at: detail.created_at,
      updated_at: detail.updated_at
    }

    # 参照先が存在しなかった時の処理
    this_hash[:year] = if detail.year == nil
                           nil
                         else
                           detail.year.year
                         end
    this_hash[:season] = if detail.season == nil
                             nil
                           else
                             detail.season.name
                           end
    this_hash[:genre] = if detail.genre == nil
                            nil
                          else
                            detail.genre.name
                          end
    this_hash[:category] = if detail.category == nil
                               nil
                             else
                               detail.category.name
                             end
    this_hash[:medium] = if detail.medium == nil
                             nil
                           else
                             detail.medium.name
                           end

    if detail.is_dir
      this_hash[:name] = detail.folder.name
      this_hash[:folder_hash] = detail.folder.folder_hash
    else
      this_path = download_path(detail.id)
      this_hash[:path] = this_path
      this_hash[:name] = detail.file.name
      this_hash[:file_modified_at] = detail.file.file_modified_at

      # extensionがnullだった時の処理
      this_hash[:extension] = if detail.file.extension == nil
                                  nil
                                else
                                  detail.file.extension.name
                                end

      # mimetypeがnullだった時の処理
      this_hash[:mimetype] = if detail.file.mimetype == nil
                                 nil
                               else
                                 detail.file.mimetype.name
                               end
    end

    return this_hash

  end

end
