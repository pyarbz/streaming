class Season < ActiveRecord::Base
  has_many :details, :dependent => :nullify
end
