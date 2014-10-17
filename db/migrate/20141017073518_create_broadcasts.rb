class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.boolean :onair, null: false, default: false
      t.boolean :movie, null: false, default: false
      t.boolean :ova, null: false, default: false
      t.boolean :complete, null: false, default: false
      t.integer :year
      t.references :season, index: true, null: false

    end
  end
end
