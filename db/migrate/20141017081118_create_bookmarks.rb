class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :count
      t.boolean :flag
      t.references :user, index: true
      t.references :bitcasa_file, index: true

      t.timestamps
    end
  end
end
