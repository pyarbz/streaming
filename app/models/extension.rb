class Extension < ActiveRecord::Base
  belongs_to :medium
  has_many :bitcasa_files
end
