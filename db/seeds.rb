# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.create(code: 'GLA', name: 'Glasgow International', latitude: 700, longitude: 10)
Airport.create(code: 'LHR', name: 'London Heathrow', latitude: 750, longitude: 250)
Airport.create(name: 'Toronto Pearson International', code: 'YYZ', latitude: 0, longitude: 50)
Airport.create(name: 'John F. Kennedy International', code: 'JFK', latitude: 20, longitude: 400)
