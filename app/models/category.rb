class Category < ActiveRecord::Base
  has_many :bitcasa_files
  has_many :bitcasa_folders
  has_one :category_media, :dependent => :destroy
  has_one :media, :through => :category_media
  has_many :category_genres, :dependent => :destroy
  has_many :genres, :through => :category_genres
end
