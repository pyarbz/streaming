class ChangeColumnToDetails < ActiveRecord::Migration
  def change
    change_table :details do |t|
      t.change :have_child, :boolean, null: false
    end
  end
end
