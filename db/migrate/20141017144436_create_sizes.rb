class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :size
      t.boolean :high
      t.boolean :blu_ray
      t.references :bitcasa_file, index: true
      t.references :bitcasa_folder, index: true
    end
  end
end
