class RemoveImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :image, :imege_id
  end
end
