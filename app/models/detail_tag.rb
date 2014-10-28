class DetailTag < ActiveRecord::Base
  belongs_to :detail
  belongs_to :tag
end
