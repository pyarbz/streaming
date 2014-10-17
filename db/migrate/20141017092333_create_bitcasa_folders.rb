class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name
      t.references :path, index: true
      t.references :genre, index: true
      t.references :bitcasa_time, index: true
      t.references :size, index: true
      t.references :broadcast, index: true

      t.timestamps
    end
  end
end
