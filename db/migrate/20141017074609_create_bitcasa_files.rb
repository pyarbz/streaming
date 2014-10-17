class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name
      t.string :file_id
      t.references :path, index: true
      t.references :broadcast, index: true
      t.references :size, index: true
      t.references :extension, index: true
      t.references :genre, index: true
      t.references :bitcasa_time, index: true

      t.timestamps
    end
  end
end
