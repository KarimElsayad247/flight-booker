class CreateBookingPassenger < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :passengers
    remove_column :bookings, :passenger_id
  end
end
