class AddForeignKeyToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.foreign_key :media
    end
  end
end
