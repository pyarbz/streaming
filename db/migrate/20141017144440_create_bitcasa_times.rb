class CreateBitcasaTimes < ActiveRecord::Migration
  def change
    create_table :bitcasa_times do |t|
      t.datetime :created_at, null: false
      t.datetime :modified_at, null: false
      t.datetime :changed_at, null: false
      t.references :bitcasa_file, index: true, null: false
      t.references :bitcasa_folder, index: true, null: false
    end
  end
end
