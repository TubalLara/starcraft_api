# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Player.create(name: 'NooB')
p2 = Player.create(name: 'camper')
p3 = Player.create(name: 'johnny')
p4 = Player.create(name: 'firebat')
p5 = Player.create(name: 'zealot')
p6 = Player.create(name: 'zerling')



matches = Match.create([
  {loser_faction: 'protoss', winner_faction: 'zerg', loser_id: p1.id, winner_id: p2.id},
  {loser_faction: 'terran', winner_faction: 'protoss', loser_id: p3.id, winner_id: p4.id},
  {loser_faction: 'zerg', winner_faction: 'terran', loser_id: p5.id, winner_id: p6.id},
  {loser_faction: 'protoss', winner_faction: 'zerg', loser_id: p3.id, winner_id: p2.id}
  ])

