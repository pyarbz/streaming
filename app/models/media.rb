class Media < ActiveRecord::Base
  has_many :extensions
  has_many :categories
end
