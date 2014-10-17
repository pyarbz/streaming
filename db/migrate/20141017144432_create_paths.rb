class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :parent, null: false, unique: true
      t.string :current, null: false, unique: true
      t.integer :depth, null: false
      t.references :bitcasa_file, index: true, null: false
      t.references :bitcasa_folder, index: true, null: false

      t.timestamps
    end
  end
end
