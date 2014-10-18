class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name, null: false, unique: true
    end
  end
end
