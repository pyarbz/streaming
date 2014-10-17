class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
