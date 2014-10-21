class AddForeignKeyToMimetypes < ActiveRecord::Migration
  def change
    change_table :mimetypes do |t|
      t.foreign_key :media
    end
  end
end
