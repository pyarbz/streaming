class AddForeignKeyToMimetypes < ActiveRecord::Migration
  def change
    change_table :mimetypes do |t|
      t.foreign_key :media, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
