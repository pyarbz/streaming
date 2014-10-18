class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name, null: false
      t.references :genre, index: true

      t.timestamps null: false
    end
  end
end
