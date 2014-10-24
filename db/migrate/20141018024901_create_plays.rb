class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :count, null: false, default: 0
      t.datetime :played_at, null: false
      t.references :user, index: true, null: false
      t.references :detail_file, index: true, null: false
    end
  end
end
