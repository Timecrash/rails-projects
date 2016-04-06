class CreatePassengerBookings < ActiveRecord::Migration
  def change
    create_table :passenger_bookings do |t|
      t.integer :booking_id
      t.integer :passenger_id
      t.timestamps null: false
    end
    rename_column :bookings, :flight, :flight_id
  end
end
