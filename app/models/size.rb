class Size < ActiveRecord::Base
  has_many :bitcasa_files, :dependent => :destroy
  has_many :bitcasa_folders, :dependent => :destroy
end
