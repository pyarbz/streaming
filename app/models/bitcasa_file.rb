class BitcasaFile < ActiveRecord::Base
  belongs_to :genre
  belongs_to :extension
  has_many :broadcasts
  has_many :paths, :dependent => :destroy
  has_many :sizes, :dependent => :destroy
  has_many :plays, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :bitcasa_times, :dependent => :destroy
  has_many :bitcasa_file_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_file_tags
end
