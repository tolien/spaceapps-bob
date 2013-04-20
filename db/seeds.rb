# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.create(code: 'GLA', name: 'Glasgow International', latitude: 38.898556, longitude: -77.037852)
Airport.create(code: 'LHR', name: 'London Heathrow', latitude: 51.4775, longitude: -0.461389)
Airport.create(name: 'Toronto Pearson International', code: 'YYZ', latitude: 43.676667, longitude: -79.630556)
Airport.create(name: 'John F. Kennedy International', code: 'JFK', latitude: 40.639722, longitude: -73.778889)
