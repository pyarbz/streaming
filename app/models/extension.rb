class Extension < ActiveRecord::Base
  belongs_to :bitcasa_file
  has_many :medias
end
