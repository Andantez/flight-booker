# frozen_string_literal: true

class AddIndexToFlight < ActiveRecord::Migration[6.0]
  def change
    add_index :flights, %i[departing_flight_id arriving_flight_id], unique: true
  end
end
