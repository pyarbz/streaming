class CreateExtensionMedia < ActiveRecord::Migration
  def change
    create_table :extension_media do |t|
      t.references :extension, index: true, null: false
      t.references :media, index: true, null: false
    end
  end
end
