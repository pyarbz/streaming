class BitcasaFile < ActiveRecord::Base
  belongs_to :path
  belongs_to :broadcast
  belongs_to :size
  belongs_to :extension
  belongs_to :genre
  belongs_to :bitcasa_time
  has_many :bitcasa_file_tags
  has_many :plays
  has_many :bookmarks
end
