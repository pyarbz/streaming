class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name, null: false
      t.string :file_id, null: false, unique: true
      t.references :play, index: true, null: false
      t.references :bookmark, index: true, null: false

      t.timestamps null: false
    end
  end
end
