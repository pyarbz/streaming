class Year < ActiveRecord::Base
  has_many :details, :dependent => :nullify
end
