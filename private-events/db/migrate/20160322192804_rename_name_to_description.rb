class RenameNameToDescription < ActiveRecord::Migration
  def change
    rename_column :events, :name, :description
  end
end
