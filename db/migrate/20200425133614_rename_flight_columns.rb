# frozen_string_literal: true

class RenameFlightColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :flights, :start_of_the_flight, :datetime
    rename_column :flights, :departing_id, :departing_flight_id
    rename_column :flights, :arriving_id, :arriving_flight_id
  end
end
