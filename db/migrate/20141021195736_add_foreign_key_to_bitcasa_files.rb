class AddForeignKeyToBitcasaFiles < ActiveRecord::Migration
  def change
    change_table :bitcasa_files do |t|
      t.foreign_key :details, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      t.foreign_key :extensions, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
      t.foreign_key :mimetypes, options: 'ON UPDATE CASCADE ON DELETE SET NULL'
    end
  end
end
