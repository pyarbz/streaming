# encoding: utf-8

=begin

 BitcasaAPIからデータを取得するモジュール
 データを取得するときは[self.fetch]を使用し、
 パラメーターの設定等は[set_parameter]に追加する。

 ・パラメーターの説明
 # type 観光種類(公共とかいろいろ)
 # offset 取得位置 30件目から取得する等...
 # limit 取得件数 30件目から10件取得する等(30件目から40件目まで取得)

 ・Controllerから使用する時
 # BitcasaHelper.fetch(type, #任意[offset])

=end

module BitcasaHelper

#  client_id = 'aaaaas'
#  CLIENT_ID = ENV[client_id]

#  client_secret = 'bbbbbb'
#  CLIENT_SECRET = ENV[client_secret]

#  authorization_code = 'cccccc'
#  AUTHORIZATION_CODE = ENV[authorization_code]

#  redirect = 'http://localhost'
#  REDIRECT_URL = ENV[redirect]

  # access_token = 'ddddddddddd'
  ACCESS_TOKEN = ENV[ACCESS_TOKEN]

  #取得先
  BASE_URL = 'https://developer.api.bitcasa.com/v1'

  #取得件数
  #LIMIT = 10;

  #ファイルのある場所
  @FILE_PATH = nil

  #ファイルの名前
  @FILE_NAME = nil

  # リスト一覧を取得する。
  def self.fetch_list(params)
    httpClient = HTTPClient.new
    begin
      # get request
      data = httpClient.get_content(BASE_URL+'/folders'+@FILE_PATH,params)
      # return JSON.parse data
      return data
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

  # リスト一覧取得時に送るパラメータをセットする。
  ## depth: filesystem/pathの位置。0 = 無限、1 = 現在のディレクトリまで
  def self.set_params_list(filepath)
    # param =  {'access_token' => ACCESS_TOKEN, 'depth' => depth}
    param =  {'access_token' => ACCESS_TOKEN}
    @FILE_PATH = filepath
    return param;
  end

  # ファイルのURLを取得する。
  def self.get_fileURL(params)
    getURL = BASE_URL + '/files/' + @FILE_NAME + '?access_token=' + params['access_token'] + '&path=' + params['path']
    param = {'file_URL' => getURL}
    return param;
  end

  # ファイル取得時に送るパラメータをセットする。
  def self.set_params_file(filepath,filename)
    # param =  {'access_token' => ACCESS_TOKEN, 'depth' => depth}
    param =  {'access_token' => ACCESS_TOKEN, 'path' => filepath}
    @FILE_NAME = filename
    return param;
  end

end
