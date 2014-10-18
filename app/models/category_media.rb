class CategoryMedia < ActiveRecord::Base
  belongs_to :category
  belongs_to :media
end
