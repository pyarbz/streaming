class CreateBitcasaFiles < ActiveRecord::Migration
  def change
    create_table :bitcasa_files do |t|
      t.string :name, null: false
      t.string :file_id, null: false
      t.references :mimetype, index: true, null: false
      t.references :extension, index: true, null: false
      t.references :detail, index: true, null: false
    end
    add_index :bitcasa_files, :file_id, unique: true
  end
end
