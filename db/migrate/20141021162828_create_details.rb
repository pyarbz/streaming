class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :path, null: false
      t.datetime :bitcasa_created_at, null: false
      t.datetime :bitcasa_modified_at, null: false
      t.datetime :bitcasa_changed_at, null: false
      t.integer :size, null: false, default: 0, limit: 8
      t.boolean :high_definition, null: false, default: false
      t.boolean :blu_ray, null: false, default: false
      t.boolean :onair, null: false, default: false
      t.boolean :movie, null: false, default: false
      t.boolean :ova, null: false, default: false
      t.boolean :complete, null: false, default: false
      t.references :year, index: true
      t.references :season, index: true
      t.references :category, index: true
      t.references :medium, index: true
      t.references :genre, index: true

      t.timestamps null: false
    end
    add_foreign_key :details, :years
    add_foreign_key :details, :seasons
    add_foreign_key :details, :categories
    add_foreign_key :details, :media
    add_foreign_key :details, :genres
  end
end
