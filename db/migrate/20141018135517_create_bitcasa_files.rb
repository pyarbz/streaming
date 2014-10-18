class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name, null: false
      t.string :file_id, null: false, unique: true
      t.references :extension, index: true, null: false
      t.references :category, index: true
      t.references :media, index: true
      t.references :genre, index: true

      t.timestamps null: false
    end
  end
end
