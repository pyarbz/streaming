class AddForeignKeyToPlays < ActiveRecord::Migration
  def change
    change_table :plays do |t|
      t.foreign_key :users
      t.foreign_key :bitcasa_files
    end
  end
end
