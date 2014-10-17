class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, unique: true
      t.references :category, index: true, null: false

    end
  end
end
