class CategoryGenre < ActiveRecord::Base
  belongs_to :category
  belongs_to :genre
end
