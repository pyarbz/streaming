class BitcasaFile < ActiveRecord::Base
  belongs_to :extension
  belongs_to :category
  belongs_to :media
  belongs_to :genre
  has_many :bitcasa_file_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_file_tags
  has_many :plays, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_one :detail, :dependent => :destroy
end
