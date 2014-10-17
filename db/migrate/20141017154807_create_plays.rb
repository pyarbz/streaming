class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :count, null: false, default: 0
      t.datetime :played_at, null: false
    end
  end
end
