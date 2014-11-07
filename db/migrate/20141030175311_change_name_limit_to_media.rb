class ChangeNameLimitToMedia < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.change :name, :string, null: false, limit: 15
    end
  end
end
