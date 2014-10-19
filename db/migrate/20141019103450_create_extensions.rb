class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name, null: false
      t.references :media, index: true, null: false
    end
    add_index :extensions, :name, unique: true
  end
end
