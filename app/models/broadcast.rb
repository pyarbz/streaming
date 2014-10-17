class Broadcast < ActiveRecord::Base
  belongs_to :season
  has_many :bitcasa_files
  has_many :bitcasa_folders
end
