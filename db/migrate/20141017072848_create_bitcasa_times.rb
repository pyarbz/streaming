class CreateBitcasaTimes < ActiveRecord::Migration
  def change
    create_table :bitcasa_times do |t|
      t.datetime :created_at
      t.datetime :modified_at
      t.datetime :changed_at

      t.timestamps
    end
  end
end
