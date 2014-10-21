class CreateDetailClosures < ActiveRecord::Migration
  def change
    create_table :detail_closures do |t|
      t.integer :depth, null: false
      t.integer :ancestor_detail_id, null: false
      t.integer :descendant_detail_id, null: false
    end
  end
end
