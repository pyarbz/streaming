class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :size, null: false, default: 0, limit: 8
      t.boolean :high, null: false, default: false
      t.boolean :blu_ray, null: false, default: false
      t.references :bitcasa_file, index: true, null: false
      t.references :bitcasa_folder, index: true, null: false
    end
  end
end
