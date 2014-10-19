class CreateDetailTags < ActiveRecord::Migration
  def change
    create_table :detail_tags do |t|
      t.references :detail, index: true, null: false
      t.references :tag, index: true, null: false

      t.timestamps null: false
    end
  end
end
