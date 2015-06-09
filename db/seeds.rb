# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pila_packs_list = [
    ["Lite", 10000, 10000],
    ["Medium", 20000, 20000],
    ["Pro", 30000, 30000],
    ["Super Pro", 50000, 50000],
    ["Mega Pro", 100000, 100000],
    ["Hyper Mega Pro", 300000, 300000],
    ]

pila_packs_list.each do |nome, real, pila|
    PilaPack.create name: nome, real_value: real, pila_value: pila
end
    