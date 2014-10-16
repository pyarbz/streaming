class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :parent
      t.string :current
      t.integer :depth

      t.timestamps
    end
  end
end
