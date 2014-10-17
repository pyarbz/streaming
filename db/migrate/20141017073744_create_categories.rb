class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.references :media, index: true, null: false

    end
  end
end
