class GenerateHash

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
      path: PathObject.generate_path(detail.id),
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
      # this_path = PathObject.download_path(detail.id)
      # this_hash[:download_path] = this_path
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

  # detailの自分、親子情報をhashで返すメソッド
  # detail: Detail以外は受け付けない。detailじゃなかったらnilを返す
  def self.generate_detail_info(detail)

    return nil unless detail.class == Detail::ActiveRecord_Relation
    this_info = {
      current: nil,
      parent: nil,
      child: nil,
      request: true
    }

    # 自分自身の情報を取得
    detail.find_each do |current|
      this_hash = GenerateHash.generate_object_hash(current)
      this_info[:current] = this_hash
    end


    # root以外は親を取得
    unless this_info[:current][:is_root]
      # DBから取得
      parents = GetObject.get_parents(detail, 1)
      parents.find_each do |parent|
        this_hash = GenerateHash.generate_object_hash(parent)
        this_info[:parent] = this_hash
      end
    end

    # ディレクトリが子を持つ場合は子を取得
    if this_info[:current][:have_child]
      this_info[:child] = []
      # DBから取得
      childs = GetObject.get_childs(detail, 1)
      childs.find_each do |child|
        this_hash = GenerateHash.generate_object_hash(child)
        this_info[:child].push(this_hash)
      end
    end

    return this_info
  end


  # detailのpath情報をhashで作成して返すメソッド
  # detail: Detail以外は受け付けない。detailじゃなかったらnilを返す
  def self.generate_object_path_hash(detail)
    return nil unless detail.class == Detail
    this_hash = {
      id: detail.id,
      path: PathObject.generate_path(detail.id),
      is_root: detail.is_root,
      is_dir: detail.is_dir,
      have_child: detail.have_child
    }

    if detail.is_dir
      this_hash[:name] = detail.folder.name
    else
      this_hash[:name] = detail.file.name
    end

    return this_hash

  end

  # detail pathの自分、子情報をhashで返すメソッド
  # detail: Detail以外は受け付けない。detailじゃなかったらnilを返す
  def self.generate_detail_path_info(detail)

    return nil unless detail.class == Detail::ActiveRecord_Relation
    this_info = {
      current: nil,
      child: nil,
      request: true
    }

    # 自分自身の情報を取得
    detail.find_each do |current|
      this_hash = GenerateHash.generate_object_path_hash(current)
      this_info[:current] = this_hash
    end

    # ディレクトリが子を持つ場合は子を取得
    if this_info[:current][:have_child]
      this_info[:child] = []
      # DBから取得
      childs = GetObject.get_childs(detail, 1)
      childs.find_each do |child|
        this_hash = GenerateHash.generate_object_path_hash(child)
        this_info[:child].push(this_hash)
      end
    end

    return this_info
  end

end
