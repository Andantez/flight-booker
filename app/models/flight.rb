# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departing_flight, class_name: 'Airport',
                                foreign_key: 'departing_id'
  belongs_to :arriving_flight,  class_name: 'Airport',
                                foreign_key: 'arriving_id'
end
