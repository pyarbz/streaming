class BitcasaFolder < ActiveRecord::Base
  belongs_to :category
  belongs_to :media
  belongs_to :genre
  has_many :bitcasa_folder_tags, :dependent => :destroy
  has_many :tags, :through => :bitcasa_folder_tags
  has_one :detail, :dependent => :destroy
end
