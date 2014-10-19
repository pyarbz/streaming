class CreateBitcasaFolders < ActiveRecord::Migration
  def change
    create_table :bitcasa_folders do |t|
      t.string :name, null: false
      t.references :detail, index: true, null: false
    end
  end
end
