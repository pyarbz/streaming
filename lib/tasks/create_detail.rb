class CreateDetail
  def self.create_index
    param_data = {
      path: '/',
      parent_id: nil,
      layer: 0
    }
    @list = {
      request: false
    }
    @list[:request] = DetailIndex.create_index(param_data)
    # render json: @list
    puts @list
  end
end
