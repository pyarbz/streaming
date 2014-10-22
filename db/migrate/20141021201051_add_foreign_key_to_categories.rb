class AddForeignKeyToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.foreign_key :media, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
