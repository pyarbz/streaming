class Broadcast < ActiveRecord::Base
  belongs_to :bitcasa_file
  belongs_to :bitcasa_folder
end
