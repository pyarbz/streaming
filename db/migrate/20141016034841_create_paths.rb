class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :parent, null: false, unique: true
      t.string :current, null: false, unique: true
      t.integer :depth, null: false

      t.timestamps null: false
    end
  end
end
