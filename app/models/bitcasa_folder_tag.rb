class BitcasaFolderTag < ActiveRecord::Base
  belongs_to :bitcasa_folder
  belongs_to :tag
end
