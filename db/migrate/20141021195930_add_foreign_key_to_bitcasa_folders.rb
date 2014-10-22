class AddForeignKeyToBitcasaFolders < ActiveRecord::Migration
  def change
    change_table :bitcasa_folders do |t|
      t.foreign_key :details, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
