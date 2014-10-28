class Genre < ActiveRecord::Base
  belongs_to :category
  has_many :details, :dependent => :nullify
end
