class BitcasaFileTag < ActiveRecord::Base
  belongs_to :bitcasa_file
  belongs_to :tag
end
