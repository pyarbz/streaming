class Detail < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  belongs_to :category
  belongs_to :media
  belongs_to :genre
  has_many :bitcasa_files, :dependent => :destroy
  has_many :bitcasa_folders, :dependent => :destroy
  has_many :detail_tags, :dependent => :destroy
  has_many :tags, :through => :detail_tags
end
