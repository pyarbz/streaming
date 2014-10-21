class AddForeignKeyToGenres < ActiveRecord::Migration
  def change
    change_table :genres do |t|
      t.foreign_key :categories
    end
  end
end
