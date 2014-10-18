class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name, null: false, unique: true
      t.references :media, index: true, null: false
    end
  end
end
