class AddForeignKeyToDetails < ActiveRecord::Migration
  def change
    change_table :details do |t|
      t.foreign_key :years, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
      t.foreign_key :seasons, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
      t.foreign_key :categories, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
      t.foreign_key :media, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
      t.foreign_key :genres, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
    end
  end
end
