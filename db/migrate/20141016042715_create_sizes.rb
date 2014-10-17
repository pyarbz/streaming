class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :size, null: false, limit: 8
      t.boolean :high, null: false, default: false
      t.boolean :blu_ray, null: false, default: false

    end
  end
end
