class CreateDetailClosures < ActiveRecord::Migration
  def change
    create_table :detail_closures do |t|
      t.integer :depth, null: false
      t.references :detail, index: true, null: false
    end
  end
end
