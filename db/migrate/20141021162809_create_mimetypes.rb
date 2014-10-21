class CreateMimetypes < ActiveRecord::Migration
  def change
    create_table :mimetypes do |t|
      t.string :name, null: false
      t.references :medium, index: true, null: false
    end
    add_index :mimetypes, :name, unique: true
    add_foreign_key :mimetypes, :media
  end
end
