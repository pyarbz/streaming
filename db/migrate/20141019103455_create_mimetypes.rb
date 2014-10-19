class CreateMimetypes < ActiveRecord::Migration
  def change
    create_table :mimetypes do |t|
      t.string :name, null: false
      t.references :media, index: true, null: false
    end
    add_index :mimetypes, :name, unique: true
  end
end
