require 'dropbox_sdk'

module DropboxHelper

  #Dropboxのtoken
  DROPBOX_TOKEN = ENV['DROPBOX_TOKEN']

  #取得先
  BASE_URL = 'https://api.dropbox.com/1'

  #ヘッダ
  HEADER = {
      Authorization: 'Bearer ' + DROPBOX_TOKEN
  }

  # DropboxからFile一覧を取得する
  def self.get_fileList(params)

    client = DropboxClient.new(DROPBOX_TOKEN)
    this_params = set_params(params)
    datas = client.metadata(
      this_params[:path],
      this_params[:file_limit],
      this_params[:list],
      nil,
      nil,
      this_params[:include_deleted]
    )

    # 文字列ハッシュをシンボルハッシュに変換
    datas = datas.deep_symbolize_keys

    ret_datas = {
      contents: [],
      request: false
    }

    # Drpobox APIからgetできなかった場合false
    if datas == nil
      return ret_datas
    else
      ret_datas[:path] = datas[:path]
      ret_datas[:is_dir] = datas[:is_dir]
      ret_datas[:size] = datas[:bytes]
      ret_datas[:modified] = datas[:modified]
      ret_datas[:request] = true

      # ディレクトリだった場合
      if datas[:is_dir]
        ret_datas[:hash] = datas[:hash]

        # ディレクトリが子を持つ場合
        unless datas[:contents] == nil
          # for data in datas[:contents]
          datas[:contents].each do |data|
            ret_data = {}
            ret_data[:path] = data[:path]
            ret_data[:is_dir] = data[:is_dir]
            ret_data[:size] = data[:bytes]
            ret_data[:modified] = data[:modified]

            # 子がファイルだった場合
            unless data[:is_dir]
              extension = nil
              # 拡張子を持っていた場合
              this_path = data[:path]
              if this_path.include?('.')
                extension = this_path.split('.').last
              end
              ret_data[:mimetype] = data[:mime_type]
              ret_data[:extension] = extension
              ret_data[:client_mtime] = data[:client_mtime]
            end
            ret_datas[:contents].push(ret_data)
          end
        end

        # フォルダだった場合
      else
        extension = nil
        # 拡張子を持っていた場合
        this_path = datas[:path]
        if this_path.include?('.')
          extension = this_path.split('.').last
        end
        ret_datas[:mimetype] = datas[:mime_type]
        ret_datas[:extension] = extension
        ret_datas[:client_mtime] = datas[:client_mtime]
      end
    end

    return ret_datas
  end

  # Dropboxからファイルを取得し、そのURLを返す
  def self.get_fileURL(params)
    client = DropboxClient.new(DROPBOX_TOKEN)

    info = get_fileList(params)

    ret_data = {
        url: nil,
        # expires: nil,
        mimetype: nil,
        request: false
    }

    # Drpobox APIからgetできなかった場合false
    if info == nil
      return ret_data
    else
      ret_data[:request] = true
      # ディレクトリだった場合null
      if info[:is_dir]
        return ret_data
      else
        this_params = set_params(params)
        data = client.media(this_params[:path])

        # 文字列ハッシュをシンボルハッシュに変換
        data = data.deep_symbolize_keys

        ret_data[:url] = data[:url]
        # ret_data['expires'] = data['expires']
        ret_data[:mimetype] = info[:mimetype]
        return ret_data
      end
    end
  end

  # Dropboxのパラメータのセット
  def self.set_params(params)

    # Dropbox API
    path = params[:path]
    list = params[:list]
    file_limit = params[:file_limit]
    include_deleted = params[:include_deleted]

    # オリジナル
    depth = params[:depth]

    # デフォルトのディレクトリはRoot
    if params[:path] == nil then
      path = '/'
    end

    # リストはtrue
    if params[:list] == nil then
      list = true
    end

    # デフォルトの取得数は10000
    if params[:file_limit] == nil then
      file_limit = 10000
    end

    # 削除したファイルを含めない
    if params[:include_deleted] == nil then
      include_deleted = false
    end

    # デフォルトの深さは1
    if params[:depth] == nil then
      depth = 1
    end

    this_param =  {
        path: path,
        list: list,
        file_limit: file_limit,
        include_deleted: include_deleted,
        depth: depth
    }
    return this_param
  end

  # dropboxAPIから、子のpathリストを配列として返すメソッド
  # data: DropboxHelper.get_fileListのhashデータ
  # path_list: 配列データ。中身はstringのpath
  def self.dropbox_api_file_list(data)
    path_list = []

    data[:contents].each do |content|
      unless content[:is_dir] #ファイルのみ
        path_list.push(content[:path])
      end
    end

    return path_list
  end

end
