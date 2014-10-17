class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name

      t.timestamps
    end
  end
end
