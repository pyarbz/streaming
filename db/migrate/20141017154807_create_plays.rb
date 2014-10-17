class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :count
      t.datetime :played_at
    end
  end
end
