class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.references :path, index: true
      t.references :genre, index: true
      t.references :bitcasa_time, index: true
      t.references :size, index: true

      t.timestamps
    end
  end
end
