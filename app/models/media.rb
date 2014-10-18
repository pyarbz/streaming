class Media < ActiveRecord::Base
  has_many :categories
  has_many :extensions
end
