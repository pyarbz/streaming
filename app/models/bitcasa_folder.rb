class BitcasaFolder < ActiveRecord::Base
  belongs_to :path
  belongs_to :genre
  belongs_to :bitcasa_time
  belongs_to :size
  has_many :bitcasa_folder_tags
end
