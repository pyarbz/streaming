class Year < ActiveRecord::Base
  has_many :broadcasts, :dependent => :nullify
end
