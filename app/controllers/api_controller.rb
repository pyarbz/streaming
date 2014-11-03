class ApiController < ApplicationController
  # before_filter :authenticate_user! #ログインしている時しかアクセスできないようにする

  # /api
  def index
    param_data = {
      path: '/',
      parent_id: nil,
      layer: 0
    }
    @data = DetailObject.create_this(param_data)
    # @data = DetailObject.get_root
    # @data = DetailObject.generate_path(3)

    # @data = "hello"
    # render :json => data
  end

  # /api/root
  def get_root_info
    @root_info = DetailObject.get_root
    render json: @root_info
  end

  # /api/detail
  def get_object_info
    @object_info = DetailObject.get_object(params)
    render json: @object_info
  end

end
