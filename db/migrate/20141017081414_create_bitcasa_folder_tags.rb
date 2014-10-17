class CreateBitcasaFolderTags < ActiveRecord::Migration
  def change
    create_table :bitcasa_folder_tags do |t|
      t.references :bitcasa_folder, index: true, null: false
      t.references :tag, index: true, null: false

      t.timestamps null: false
    end
  end
end
