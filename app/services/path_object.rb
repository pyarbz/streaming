class PathObject

  #rootのパス
  ROOT_PATH = '/'

  # parent idを親に持つ子のpathリストを作成
  def self.file_path_list(parent_id)

    params = {
      id: parent_id
    }

    path_list = []

    detail_list = GetObject.get_object_path(params)

    detail_list[:child].each do |content|
      path_list.push(content[:path]) unless content[:is_dir]
    end
    return path_list
  end

  # dropbox dataが持つ、pathリストを作成(子情報も含む)
  def self.dropbox_path_lists(data)

    return_data = {
      pathlist: [],
      hash: nil
    }

    return_data[:pathlist].push(data[:path])

    # 子供を持つときのみ、子供のパスを追加する
    if data[:contents].present?
      data[:contents].each do |content|
        return_data[:pathlist].push(content[:path])
      end
    end

    # ディレクトリのみhash値を追加
    return_data[:hash] = data[:hash] if data[:hash].present?

    return return_data
  end

  # params[:path]が持つ、pathリストを作成(子情報も含む)
  def self.path_and_id_lists(params)

    path = params[:path]
    this_params = {}

    if path == '/'
      detail = Detail.find_by(is_root: true)
      if detail.present?
        this_params[:id] = detail.id
      end
    else
      this_params[:id] = PathObject.this_id(params)
    end

    detail_list = GetObject.get_object_path(this_params)

    # return detail_list
    return_data = {
      pathlist: [],
      path_id_maps: []
    }

    # 子情報を取得出来なかった場合は空で返す
    return return_data unless detail_list[:request]

    return_data[:pathlist].push(detail_list[:current][:path])

    this_maps = {
      id: detail_list[:current][:id],
      path: detail_list[:current][:path]
    }

    return_data[:path_id_maps].push(this_maps)

    # 子供を持つときのみ、子供のパスを追加する
    if detail_list[:child].present?
      detail_list[:child].each do |content|
        return_data[:pathlist].push(content[:path])

        this_maps = {
          id: content[:id],
          path: content[:path]
        }
        return_data[:path_id_maps].push(this_maps)

      end
    end
    return return_data
  end

  # pathを探すメソッド
  # 見つかったらDetailのidを返す
  # 見つからなければnilを返す

  # 引数：params[:path] = パス
  # 返り値: detailのid
  def self.this_id(params)
    path = params[:path]

    root_id = Detail.find_by(is_root: true).id
    if path == '/'
      root_id = nil if root_id.blank?
      return root_id
    end

    # 最初のスラッシュを削除
    path = path.slice(1..-1) if path.chr == '/'

    path_array = path.split('/')
    path_name = path_array.last
    path_height = path_array.size

    # # details.pathに同じ名前が存在するか確認する
    detail = Detail.where('details.path = ?', path_name)

    # # # 同じ高さのdetailを抜き出し、そのidを配列に格納する
    same_details = detail.joins(:descendant_relations)
    .where('detail_closures.ancestor_detail_id = ?', root_id)
    .where('detail_closures.depth = ?', path_height)
    .select('details.*')
    .pluck('details.id')

    # joinして空になったらnil
    return nil if same_details.blank?

    # pathとdetail IDのINDEXを作成
    same_hash = {contents: []}

    same_details.each do |id|
      path = PathObject.generate_path(id)
      content = {
        id: id,
        path: path
      }
      same_hash[:contents].push(content)
    end

    # indexの中にpathが存在したらidを返す
    same_hash[:contents].each do |content|
      return content[:id] if content[:path] == params[:path]
    end

    return nil
  end


  # pathを探すメソッド
  # 見つかったらdetailのidを返す
  # 見つからなければnilを返す
  #
  # 引数: params[:path] = ほしいパス
  # 引数: params[:id] = 親のid
  # 返り値: detailのid
  # def self.next_id(params)
  #
  #   id = params[:id]
  #   path = params[:path]
  #   params = {}
  #
  #   if id == nil
  #     params[:id] = Detail.find_by(is_root: true).id
  #   else
  #     params[:id] = id
  #   end
  #
  #   detail_list = GetObject.get_object_path(params)
  #
  #   # return detail_list
  #   detail_list[:child].each do |content|
  #     return content[:id] if content[:path] == path
  #   end
  #
  #   return nil
  # end


  # idのパスを文字列で返すメソッド
  # 見つからなければnilを返す
  # 見つかったらstringで返す
  # @param [Integer] detail_id
  # @return [String]
  def self.generate_path(detail_id)

    detail = Detail.where('details.id = ?', detail_id)

    # idが見つからなかったらnullを返す
    return nil if detail.blank?

    # detail idがrootなら/を返す
    root_id = Detail.find_by(is_root: true).id
    return '/' if root_id == detail_id


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

    this_path = PathObject.generate_path(detail_id)

    # return this_path
    this_params = {
      path: this_path
    }

    this_path = DropboxHelper.get_fileURL(this_params)

    return this_path[:url]
  end

end