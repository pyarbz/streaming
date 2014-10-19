class Category < ActiveRecord::Base
  belongs_to :media
  has_many :genres
  has_many :details, :dependent => :nullify
end
