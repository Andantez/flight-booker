class RemoveIndexFromFlights < ActiveRecord::Migration[6.0]
  def change
    remove_index :flights, column: %i[departing_flight_id arriving_flight_id]
  end
end
