# encoding: utf-8

class BitcasaController < ApplicationController
  # before_filter :authenticate_user! #ログインしている時しかアクセスできないようにする

  def api
  end

  def getfolders
    @getList = BitcasaHelper.get_fileList(params)
    render :json => @getList
  end

  def getfiles
    @getURL = BitcasaHelper.get_fileURL(params)
    render :json => @getURL
  end

end
