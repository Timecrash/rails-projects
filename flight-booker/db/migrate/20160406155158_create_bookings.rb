class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :flight

      t.timestamps null: false
    end
  end
end
