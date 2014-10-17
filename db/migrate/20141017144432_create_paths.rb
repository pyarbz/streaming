class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :parent
      t.string :current
      t.integer :depth
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true

      t.timestamps
    end
  end
end
