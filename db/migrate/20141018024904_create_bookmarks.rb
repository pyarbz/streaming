class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :count, null: false, default: 0
      t.boolean :flag, null: false, default: false
      t.references :user, index: true, null: false
      t.references :detail_file, index: true, null: false

      t.timestamps null: false
    end
  end
end
