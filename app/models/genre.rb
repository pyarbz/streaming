class Genre < ActiveRecord::Base
  has_many :bitcasa_files
  has_many :bitcasa_folders
  has_one :category_genre, :dependent => :destroy
  has_one :category, :through => :category_genre
end
