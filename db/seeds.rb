# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pila_packs_list = [
    ["Lite", 100, 100],
    ["Medium", 200, 200],
    ["Pro", 300, 300],
    ["Super Pro", 500, 500],
    ["Mega Pro", 1000, 1000],
    ["Hyper Mega Pro", 3000, 3000],
    ]

pila_packs_list.each do |nome, real, pila|
    PilaPack.create name: nome, real_value: real, pila_value: pila
end
    