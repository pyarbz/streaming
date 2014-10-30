class RenameHashColumnToDetailFolders < ActiveRecord::Migration
  def change
    change_table :detail_folders do |t|
      t.rename :hash, :folder_hash
    end
  end
end
