class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name
      t.references :media, index: true

    end
  end
end
