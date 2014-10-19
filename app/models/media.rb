class Media < ActiveRecord::Base
  has_many :details, :dependent => :nullify
  has_many :bitcasa_files, :through => :details
  has_many :bitcasa_folders, :through => :details
  has_many :extensions
  has_many :mimetypes
  has_many :categories
  has_many :genres, :through => :categories
end
