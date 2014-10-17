class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :count
      t.boolean :flag

      t.timestamps
    end
  end
end
