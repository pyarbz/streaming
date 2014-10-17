class BitcasaFile < ActiveRecord::Base
  belongs_to :play
  belongs_to :bookmark
end
