class AddForeignKeyToDetailClosures < ActiveRecord::Migration
  def change
    change_table :detail_closures do |t|
      t.foreign_key :details, column: 'ancestor_detail_id'
      t.foreign_key :details, column: 'descendant_detail_id'
    end
  end
end
