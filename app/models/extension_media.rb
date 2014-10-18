class ExtensionMedia < ActiveRecord::Base
  belongs_to :extension
  belongs_to :media
end
