class Media < ActiveRecord::Base
  belongs_to :category
  belongs_to :extension
end
