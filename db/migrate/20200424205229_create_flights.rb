class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :departing_id
      t.integer :arriving_id
      t.float :duration
      t.datetime :start_of_the_flight

      t.timestamps
    end
  end
end
