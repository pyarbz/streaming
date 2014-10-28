class CreateDetailFolders < ActiveRecord::Migration
  def change
    create_table :detail_folders do |t|
      t.string :name, null: false
      t.string :hash, null: false
      t.references :detail, index: true, null: false
    end
    add_index :detail_folders, :hash, unique: true
  end
end
