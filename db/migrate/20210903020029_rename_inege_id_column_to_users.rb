class RenameInegeIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :imege_id, :image_id
  end
end
