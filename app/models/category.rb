class Category < ActiveRecord::Base
  belongs_to :media
  has_many :genres
end
