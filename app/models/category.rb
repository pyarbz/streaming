class Category < ActiveRecord::Base
  belongs_to :genre
  has_many :medias
end
