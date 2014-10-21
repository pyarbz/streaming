class Category < ActiveRecord::Base
  belongs_to :medium
  has_many :genres
  has_many :details, :dependent => :nullify
end
