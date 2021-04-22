class CreateDepartures < ActiveRecord::Migration[6.1]
  def change
    create_table :departures do |t|
      t.string :route
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :cost_in_cents
      t.integer :seats_available

      t.timestamps
    end
  end
end
