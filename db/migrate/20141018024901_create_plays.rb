class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :count, null: false, default: 0
      t.datetime :played_at, null: false
      t.references :user, index: true, null: false
      t.references :bitcasa_file, index: true, null: false
    end
    add_foreign_key :plays, :users

  end
end
