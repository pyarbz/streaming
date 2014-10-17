class BitcasaFolder < ActiveRecord::Base
  belongs_to :path
  belongs_to :genre
  belongs_to :bitcasa_time
  belongs_to :size
  belongs_to :broadcast
  has_many :bitcasa_folder_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_folder_tags
end
