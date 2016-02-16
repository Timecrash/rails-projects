class AddPostIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :post_id, index: true, foreign_key: true
  end
end
