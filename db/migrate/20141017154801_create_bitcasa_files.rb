class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name
      t.string :file_id
      t.references :play, index: true
      t.references :bookmark, index: true

      t.timestamps
    end
  end
end
