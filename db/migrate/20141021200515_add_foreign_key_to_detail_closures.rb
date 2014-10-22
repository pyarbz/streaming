class AddForeignKeyToDetailClosures < ActiveRecord::Migration
  def change
    change_table :detail_closures do |t|
      t.foreign_key :details, column: 'ancestor_detail_id', options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      t.foreign_key :details, column: 'descendant_detail_id', options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
