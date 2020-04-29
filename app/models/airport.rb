# frozen_string_literal: true

class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: 'departing_flight_id',
                               class_name: 'Flight',
                               inverse_of: 'departed_flight'
  has_many :arriving_flights,  foreign_key: 'arriving_flight_id',
                               class_name: 'Flight',
                               inverse_of: 'arriving_flight'
end
