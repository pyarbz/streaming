class Extension < ActiveRecord::Base
  belongs_to :media
  has_many :bitcasa_files
end
