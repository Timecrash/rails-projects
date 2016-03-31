class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departing
      t.integer :arriving
      t.datetime :takeoff
      t.integer :duration

      t.timestamps null: false
    end
  end
end
