class CreateBitcasaFileTags < ActiveRecord::Migration
  def change
    create_table :bitcasa_file_tags do |t|
      t.references :bitcasa_file, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
