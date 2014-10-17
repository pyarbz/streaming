class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :size
      t.boolean :high
      t.boolean :blu_ray

    end
  end
end
