class CreateCategoryMedia < ActiveRecord::Migration
  def change
    create_table :category_media do |t|
      t.references :category, index: true, null: false
      t.references :media, index: true, null: false
    end
  end
end
