class CreateDetail
  def self.create_index

    logger = Logger.new('log/production.log')
    param_data = {
      path: '/',
      parent_id: nil,
      layer: 0
    }
    logger.debug(DetailIndex.create_index(param_data))
  end
end
