class BitcasaFolder < ActiveRecord::Base
  has_many :broadcasts
  has_many :paths, :dependent => :destroy
  has_many :sizes, :dependent => :destroy
  has_many :bitcasa_times, :dependent => :destroy
  has_many :genres
  has_many :bitcasa_folder_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_folder_tags
end
