class CreateBitcasaFileTags < ActiveRecord::Migration
  def change
    create_table :bitcasa_file_tags do |t|
      t.references :bitcasa_file, index: true, null: false
      t.references :tag, index: true, null: false

      t.timestamps null: false
    end
  end
end
