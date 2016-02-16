class ChangePostIdColumn < ActiveRecord::Migration
  def change
    rename_column :users, :post_id_id, :post_id
  end
end
