class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.references :category, index: true
      t.references :extension, index: true
    end
  end
end
