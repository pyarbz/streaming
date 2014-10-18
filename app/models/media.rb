class Media < ActiveRecord::Base
  has_many :bitcasa_files
  has_many :bitcasa_folders
  has_many :extension_medias, :dependent => :destroy
  has_many :extensions, :through => :extension_medias
  has_many :mimetypes, :through => :extension_medias
  has_many :category_medias, :dependent => :destroy
  has_many :categories, :through => :category_medias
end
