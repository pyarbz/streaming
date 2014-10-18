class CreateMimetypes < ActiveRecord::Migration
  def change
    create_table :mimetypes do |t|
      t.string :name
    end
  end
end
