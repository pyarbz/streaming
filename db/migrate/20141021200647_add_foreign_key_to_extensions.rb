class AddForeignKeyToExtensions < ActiveRecord::Migration
  def change
    change_table :extensions do |t|
      t.foreign_key :media, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
