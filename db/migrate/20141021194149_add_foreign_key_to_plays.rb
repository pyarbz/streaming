class AddForeignKeyToPlays < ActiveRecord::Migration
  def change
    change_table :plays do |t|
      t.foreign_key :users, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      t.foreign_key :bitcasa_files, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
