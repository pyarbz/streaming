class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, unique: true
      t.references :bitcasa_file, index: true, null: false
      t.references :bitcasa_folder, index: true, null: false
    end
  end
end
