class BitcasaFile < ActiveRecord::Base
  belongs_to :play
  belongs_to :bookmark
  has_many :extensions
  has_many :genres
  has_many :bitcasa_times, :dependent => :destroy
  has_many :sizes, :dependent => :destroy
  has_many :paths, :dependent => :destroy
  has_many :broadcasts
  has_many :bitcasa_file_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_file_tags
end
