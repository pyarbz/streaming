class AddForeignKeyToDetails < ActiveRecord::Migration
  def change
    change_table :details do |t|
      t.foreign_key :years
      t.foreign_key :seasons
      t.foreign_key :categories
      t.foreign_key :media
      t.foreign_key :genres
    end
  end
end
