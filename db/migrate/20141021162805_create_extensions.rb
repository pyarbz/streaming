class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name, null: false
      t.references :medium, index: true, null: false
    end
    add_index :extensions, :name, unique: true
    add_foreign_key :extensions, :media
  end
end
