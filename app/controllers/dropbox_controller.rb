class DropboxController < ApplicationController
  def index
  end

  def getfolders
    @getList = DropboxHelper.get_fileList(params)
    render :json => @getList
  end

  def getfiles
    @getURL = DropboxHelper.get_fileURL(params)
    render :json => @getURL
  end

end
