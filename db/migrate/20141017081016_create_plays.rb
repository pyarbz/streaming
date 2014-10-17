class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :count
      t.datetime :played_at
      t.references :user, index: true
      t.references :bitcasa_file, index: true

      t.timestamps
    end
  end
end
