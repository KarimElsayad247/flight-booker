class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, foreign_key: { to_table: :airports }
      t.references :arrival_airport, foreign_key: { to_table: :airports }
      t.datetime :start_datetime
      t.string :duration

      t.timestamps
    end
  end
end
