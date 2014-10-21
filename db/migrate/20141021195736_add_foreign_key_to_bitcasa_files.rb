class AddForeignKeyToBitcasaFiles < ActiveRecord::Migration
  def change
    change_table :bitcasa_files do |t|
      t.foreign_key :details
      t.foreign_key :extensions
      t.foreign_key :mimetypes
    end
  end
end
