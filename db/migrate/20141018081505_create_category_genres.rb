class CreateCategoryGenres < ActiveRecord::Migration
  def change
    create_table :category_genres do |t|
      t.references :category, index: true, null: false
      t.references :genre, index: true, null: false
    end
  end
end
