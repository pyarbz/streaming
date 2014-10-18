class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :year, null: false, unique: true
    end
  end
end
