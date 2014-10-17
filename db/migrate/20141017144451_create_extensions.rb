class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :name
      t.references :bitcasa_file, index: true
    end
  end
end
