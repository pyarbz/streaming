class BitcasaFile < ActiveRecord::Base
  belongs_to :path
  belongs_to :broadcast
  belongs_to :size
  belongs_to :extension
  belongs_to :genre
  belongs_to :bitcasa_time
end
