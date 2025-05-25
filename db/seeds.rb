# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.destroy_all

Airport.create!([
  { code: "JFK" },
  { code: "LAX" },
  { code: "SFO" },
  { code: "ORD" },
  { code: "ATL" }
])

Flight.destroy_all

jfk = Airport.find_by(code: "JFK")
lax = Airport.find_by(code: "LAX")
sfo = Airport.find_by(code: "SFO")
ord = Airport.find_by(code: "ORD")
atl = Airport.find_by(code: "ATL")

Flight.create!([
  { departure_airport: jfk, arrival_airport: sfo, departure_time: DateTime.now + 1.day, duration: 360 },
  { departure_airport: lax, arrival_airport: jfk, departure_time: DateTime.now + 2.days, duration: 300 },
  { departure_airport: atl, arrival_airport: ord, departure_time: DateTime.now + 3.days, duration: 120 },
  { departure_airport: sfo, arrival_airport: lax, departure_time: DateTime.now + 1.day + 5.hours, duration: 90 },
  { departure_airport: ord, arrival_airport: atl, departure_time: DateTime.now + 2.days + 3.hours, duration: 130 }
])
