class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.boolean :onair, null: false, default: false
      t.boolean :movie, null: false, default: false
      t.boolean :ova, null: false, default: false
      t.boolean :complete, null: false, default: false
      t.references :year, index: true
      t.references :season, index: true
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true
    end
  end
end
