class Tag < ActiveRecord::Base
  has_many :bitcasa_file_tags
  has_many :bitcasa_folder_tags
end
