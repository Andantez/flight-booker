# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying all Airports'
Airport.destroy_all

airport_codes = %w[LTN LHR LGW STN MAN GLA BVA ORY CDG BER TXL VAR SOF BOJ]

airport_codes.each do |code|
  puts "Creating Airport code #{code}"
  Airport.create!(code: code)
end

Flight.destroy_all
1500.times do |i|
  airport_ids = Airport.all.ids.sample(2)
  puts "Creating flight number #{i}"
  random_datetime = Faker::Time.between(from: DateTime.now + 1.day,
                                        to: 1.years.from_now,
                                        format: :default)
  random_duration = (2.0..4.0).step(0.01).map { |x| x.round(2) }
  Flight.create!(departing_flight_id: airport_ids[0],
                           arriving_flight_id: airport_ids[1]) do |s|
    s.duration = random_duration.sample
    s.datetime = random_datetime
  end
end
