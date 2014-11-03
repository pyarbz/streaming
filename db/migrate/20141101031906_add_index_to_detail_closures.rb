class AddIndexToDetailClosures < ActiveRecord::Migration
  def change
    change_table :detail_closures do |t|
      t.index :ancestor_detail_id
      t.index :descendant_detail_id
      t.index [:ancestor_detail_id, :descendant_detail_id], name: 'index_closure_id', unique: true
    end
  end
end
