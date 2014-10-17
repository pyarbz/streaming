class CreateBitcasaFolderTags < ActiveRecord::Migration
  def change
    create_table :bitcasa_folder_tags do |t|
      t.references :bitcasa_folder, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
