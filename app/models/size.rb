class Size < ActiveRecord::Base
  has_many :bitcasa_files
  has_many :bitcasa_folders
end
