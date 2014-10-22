class AddForeignKeyToGenres < ActiveRecord::Migration
  def change
    change_table :genres do |t|
      t.foreign_key :categories, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
