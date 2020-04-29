# frozen_string_literal: true

class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers
  belongs_to :departing_flight, class_name: 'Airport',
                                inverse_of: 'departing_flights'
  belongs_to :arriving_flight,  class_name: 'Airport',
                                inverse_of: 'arriving_flights'
  validate :unique_pairs
  scope :upcomming_flights, -> { where(datetime: Date.today..Date.today + 1.week)}

  def flight_date
    datetime.strftime('%Y-%m-%d ')
  end

  def flight_time
    datetime.strftime('%H:%M')
  end

  def unique_pairs
    if departing_flight_id == arriving_flight_id
      errors.add(:flight, 'Departing and arriving id cannot be the same')
    end
  end
end
