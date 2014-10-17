class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true
    end
  end
end
