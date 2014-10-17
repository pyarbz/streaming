class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name, unique: true
      t.references :category, index: true, null: false
      t.references :extension, index: true, null: false
    end
  end
end
