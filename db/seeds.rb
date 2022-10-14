# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create!([
  {code: "ATL", name: "Hartsfield–Jackson Atlanta International Airport"},
  {code: "DFW", name: "Dallas Fort Worth International Airport"},
  {code: "DEN", name: "Denver International Airport"},
  {code: "ORD", name: "O'Hare International Airport"},
  {code: "LAX", name: "Los Angeles International Airport"},
  {code: "CLT", name: "Charlotte Douglas International Airport"},
  {code: "MCO", name: "Orlando International Airport"},
])

Flight.create!([
  {departure_airport: Airport.first, arrival_airport: Airport.second, start_datetime: Date.tomorrow, duration: 1.hour},
  {departure_airport: Airport.third, arrival_airport: Airport.fourth, start_datetime: Date.tomorrow + 1, duration: 2.hour},
  {departure_airport: Airport.second, arrival_airport: Airport.fourth, start_datetime: Date.tomorrow + 2, duration: 5.hour},
  {departure_airport: Airport.third, arrival_airport: Airport.first, start_datetime: Date.tomorrow + 3, duration: 2.hour},
  {departure_airport: Airport.fourth, arrival_airport: Airport.first, start_datetime: Date.tomorrow + 4, duration: 8.hour},
])