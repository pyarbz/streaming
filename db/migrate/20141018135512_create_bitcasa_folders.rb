class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name, null: false
      t.references :category, index: true
      t.references :media, index: true
      t.references :genre, index: true

      t.timestamps null: false
    end
  end
end
