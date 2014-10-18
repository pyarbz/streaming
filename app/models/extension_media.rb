class ExtensionMedia < ActiveRecord::Base
  belongs_to :mimetype
  belongs_to :extension
  belongs_to :media
end
