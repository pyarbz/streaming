class Genre < ActiveRecord::Base
  belongs_to :category
  has_many :bitcasa_files
end
