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
5.times do
  random_id = (1..14).to_a
  Flight.create!(departing_id: random_id.sample, arriving_id: random_id.sample,
                 duration: 3.15, start_of_the_flight: '2020-12-29 18:45')
end
