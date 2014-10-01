# encoding: utf-8

=begin

 BitcasaAPIからデータを取得するモジュール

=end

module BitcasaHelper

  #Bitcasaのtoken
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  #取得先
  BASE_URL = 'https://developer.api.bitcasa.com/v1'

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
      puts "test"
      return data
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

  # リスト一覧取得時に送るパラメータをセットする。
  def self.set_params_list(filepath)
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
    param =  {'access_token' => ACCESS_TOKEN, 'path' => filepath}
    @FILE_NAME = filename
    return param;
  end

end
