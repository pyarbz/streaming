class AddForeignKeyToDetailTags < ActiveRecord::Migration
  def change
    change_table :detail_tags do |t|
      t.foreign_key :details
      t.foreign_key :tags
    end
  end
end
