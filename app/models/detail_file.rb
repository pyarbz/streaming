class DetailFile < ActiveRecord::Base
  belongs_to :mimetype
  belongs_to :extension
  belongs_to :detail
  has_many :bookmarks, :dependent => :destroy
  has_many :plays, :dependent => :destroy
end
