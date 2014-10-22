class AddForeignKeyToDetailTags < ActiveRecord::Migration
  def change
    change_table :detail_tags do |t|
      t.foreign_key :details, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      t.foreign_key :tags, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
