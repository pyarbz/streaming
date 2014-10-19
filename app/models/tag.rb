class Tag < ActiveRecord::Base
  has_many :detail_tags, :dependent => :destroy
  has_many :details, :through => :detail_tags
end
