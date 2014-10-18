class Mimetype < ActiveRecord::Base
  has_many :bitcasa_files
  has_one :extension_media, :dependent => :destroy
  has_one :media, :through => :extension_media
end
