class AddColumnToDetails < ActiveRecord::Migration
  def change
    change_table :details do |t|
      t.boolean :is_root, null: false, default: false
      t.boolean :have_child
    end
  end
end
