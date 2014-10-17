class Broadcast < ActiveRecord::Base
  belongs_to :bitcasa_file
  belongs_to :bitcasa_folder
  has_many :seasons
end
