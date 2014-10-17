class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps
    end
  end
end
