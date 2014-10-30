class ChangeNameLimitToMimetypes < ActiveRecord::Migration
  def change
    change_table :mimetypes do |t|
      t.change :name, :string, null: false, limit: 20
    end
  end
end
