class Play < ActiveRecord::Base
  has_many :bitcasa_files, :dependent => :destroy
  has_many :users, :dependent => :destroy
end
