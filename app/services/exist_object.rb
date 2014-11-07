class ExistObject

  # folderが存在するか確認するメソッド
  def self.folder_exists?(path)
    # params[:hash]
    # params[:path]

    params = {path: path}

    ids = PathObject.this_id(params)

    # もしhashがあればtrue
    return true if DetailFolder.exists?(folder_hash: params[:hash])

    # もしpathが同じなのがあればtrue
    return true unless ExistObject.path_exists?(params[:path]) == nil

    # なければfalse
    return false
  end


  # fileが存在するか確認するメソッド
  # dropbox_api_path_listにしかないpathを配列で返す
  def self.file_exists?(params)
    # path_list <- 配列
    # params[:dropbox_api_path_list]
    # params[:file_path_list]
    # params[:reverse]
    reverse = params[:reverse]
    # next_id()

    if reverse
      return params[:file_path_list] - params[:dropbox_api_path_list]
    else
      return params[:dropbox_api_path_list] - params[:file_path_list]
    end

  end

end
