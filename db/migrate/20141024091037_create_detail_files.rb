class CreateDetailFiles < ActiveRecord::Migration
  def change
    create_table :detail_files do |t|
      t.string :name, null: false
      t.datetime :file_modified_at, null: false
      t.references :mimetype, index: true
      t.references :extension, index: true
      t.references :detail, index: true, null: false
    end
  end
end
