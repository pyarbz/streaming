class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :parent, null: false, unique: true
      t.string :current, null: false, unique: true
      t.integer :depth, null: false
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true

      t.timestamps null: false
    end
  end
end
