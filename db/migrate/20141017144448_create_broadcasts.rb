class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.boolean :onair
      t.boolean :movie
      t.boolean :ova
      t.boolean :complete
      t.integer :year
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true
    end
  end
end
