# encoding: utf-8

=begin

  BitcasaAPIからデータを取得するモジュール

  - get_fileList
    - 概要
      BitcasaAPIに接続し、File一覧を取ってくる。
      データをJsonで返す

    - パラメータの説明
      # filepath: ファイルのパス
      # depth: フォルダの深さ
          - 基本値: 1
          - 全て取得: 0

    - Controllerから使用する時
      # BitcasaHelper.get_fileList(params)

  - get_fileURL
    - 概要
      BitcasaからFileをダウンロードするURLを作成する
      データをJsonで返す

    - パラメータの説明
      # filepath: ファイルのパス
      # filename: ファイルの名前

    - Controllerから使用する時
      # BitcasaHelper.get_fileURL(params)

=end

module BitcasaHelper

  #Bitcasaのtoken
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  #取得先
  BASE_URL = 'https://developer.api.bitcasa.com/v1'

  # BitcasaからFile一覧を取得する
  def self.get_fileList(params)

    this_params = set_fileList(params)

    httpClient = HTTPClient.new
    getURL = BASE_URL + '/folders' + this_params['filepath']
    this_params.delete('filepath')

    begin
      data = httpClient.get_content(getURL,this_params)
      return JSON.parse data
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

  # BitcasaからFile一覧を取得するパラメータのセット
  def self.set_fileList(params)

    filepath = params[:filepath]
    depth = params[:depth]

    # デフォルトのディレクトリはRoot
    if params[:filepath] == nil then
      filepath = '/szeMSv8ITT2qX5Nv6Z_UWA'
    end

    # デフォルトの深さは1
    if params[:depth] == nil then
      depth = 1
    end

    this_param =  { 'access_token' => ACCESS_TOKEN, 'depth' => depth, 'filepath' => filepath }
    return this_param
  end

  # Bitcsaからファイルを取得し、そのURLを返す
  def self.get_fileURL(params)
    this_params = set_fileURL(params)
    getURL = BASE_URL + '/files/' + this_params['filename'] + '?access_token=' + this_params['access_token'] + '&path=' + this_params['filepath']
    param = {'file_URL' => getURL}
    return param
  end

  # Bitcsaからファイルを取得し、そのURLを返すパラメータのセット
  def self.set_fileURL(params)
    filepath = params[:filepath]
    filename = params[:filename]

    # TODO: filepathが存在しない時の処理
    # if params[:filepath] == nil then
    #   return nil
    # end

    # TODO: filenameが存在しない時の処理
    # if params[:filename] == nil then
    #   return nil
    # end

    this_param =  { 'access_token' => ACCESS_TOKEN, 'filepath' => filepath, 'filename' => filename }
    return this_param
  end

end
