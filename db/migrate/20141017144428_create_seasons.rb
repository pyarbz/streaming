class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name, unique: true
      t.references :broadcast, index: true, null: false
    end
  end
end
