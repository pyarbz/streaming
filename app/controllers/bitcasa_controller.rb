# encoding: utf-8

class BitcasaController < ApplicationController
  def api
  end

  def getfolders
    filepath = params[:filepath]

    # デフォルトのディレクトリの指定
    if filepath == nil then
      filepath = '/szeMSv8ITT2qX5Nv6Z_UWA'
    end

    params = BitcasaHelper.set_params_list(filepath)
    @list_json = BitcasaHelper.fetch_list(params)
    render :json => @list_json
  end

  def getfiles
    filepath = params[:filepath]
    filename = params[:filename]

    params = BitcasaHelper.set_params_file(filepath,filename)
    @getURL = BitcasaHelper.get_fileURL(params)
    render :json => @getURL
  end
end
