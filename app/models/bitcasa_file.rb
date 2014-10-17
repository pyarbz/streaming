class BitcasaFile < ActiveRecord::Base
  belongs_to :path
  belongs_to :broadcast
  belongs_to :size
  belongs_to :extension
  belongs_to :genre
  belongs_to :bitcasa_time
  has_many :plays, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :bitcasa_file_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_file_tags
end
