class AddForeignKeyToBitcasaFolders < ActiveRecord::Migration
  def change
    change_table :bitcasa_folders do |t|
      t.foreign_key :details
    end
  end
end
