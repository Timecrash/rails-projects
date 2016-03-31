class ChangeDepartingArriving < ActiveRecord::Migration
  def change
    rename_column :flights, :departing, :departing_id
    rename_column :flights, :arriving, :arriving_id
  end
end
