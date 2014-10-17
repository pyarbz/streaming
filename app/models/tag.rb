class Tag < ActiveRecord::Base
  has_many :bitcasa_file_tags, :dependent => :destroy
  has_many :bitcasa_files, :through => :bitcasa_file_tags
  has_many :bitcasa_folder_tags, :dependent => :destroy
  has_many :bitcasa_folder, :through => :bitcasa_folder_tags
end
