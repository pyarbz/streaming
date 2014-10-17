class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name, null: false
      t.string :file_id, null: false, unique: true
      t.references :path, index: true, null: false
      t.references :broadcast, index: true, null: false
      t.references :size, index: true, null: false
      t.references :extension, index: true, null: false
      t.references :genre, index: true, null: false
      t.references :bitcasa_time, index: true, null: false

      t.timestamps null: false
    end
  end
end
