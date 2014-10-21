class AddForeignKeyToExtensions < ActiveRecord::Migration
  def change
    change_table :extensions do |t|
      t.foreign_key :media
    end
  end
end
