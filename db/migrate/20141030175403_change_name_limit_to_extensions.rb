class ChangeNameLimitToExtensions < ActiveRecord::Migration
  def change
    change_table :extensions do |t|
      t.change :name, :string, null: false, limit: 10
    end
  end
end
