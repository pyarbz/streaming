class Detail < ActiveRecord::Base
  belongs_to :year
  belongs_to :season
  belongs_to :category
  belongs_to :medium
  belongs_to :genre
  has_one :bitcasa_files, :class_name => 'BitcasaFile', :dependent => :destroy
  has_one :bitcasa_folders, :class_name => 'BitcasaFolder', :dependent => :destroy
  has_many :detail_tags, :dependent => :destroy
  has_many :tags, :through => :detail_tags
end
