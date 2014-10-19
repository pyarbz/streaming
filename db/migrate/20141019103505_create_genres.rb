class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.references :category, index: true, null: false
    end
    add_index :genres, :name, unique: true
  end
end
