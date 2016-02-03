# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1_data = {
	full_name: "Test1",
	email: "t1@t.com",
	username: "testtest1",
	password: "123",
	admin: true
}
user2_data = {
	full_name: "Test2",
	email: "t2@t.com",
	username: "testtest2",
	password: "123"
}
user1 = User.create(user1_data)
user2 = User.create(user2_data)

event1_data = {
	name: "Mew",
	coords: "123,123",
	category: "Phichic",
	dex_number: 151,
	description: "Mew. Mew. Mew. It's on the bar.",
	image: "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/151.jpeg",
	level_min: 10,
	level_max: 20,
	hash_data: "11111"
}
event2_data = {
	name: "Pikachu",
	coords: "123,123",
	category: "Electric",
	dex_number: 25,
	description: "Pika, pika. Find it next to the cashier",
	image: "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/25.jpeg",
	level_min: 10,
	level_max: 20,
	hash_data: "22222"
}
event3_data = {
	name: "Bulbasaur",
	coords: "123,123",
	category: "Grass",
	dex_number: 1,
	description: "",
	image: "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/1.jpeg",
	level_min: 20,
	level_max: 30,
	hash_data: "33333"
}
event1 = Event.create(event1_data)
event2 = Event.create(event2_data)
event3 = Event.create(event3_data)

pokemon1 = {
	level: 15
}
pokemon2 = {
	level: 20,
	team_position: 1
}

poke1 = Pokemon.create(pokemon1)
user1.pokemons << poke1
event1.pokemons << poke1

poke2 = Pokemon.create(pokemon2)
user1.pokemons << poke2
event2.pokemons << poke2

poke3 = Pokemon.create(pokemon1)
user1.pokemons << poke3
event3.pokemons << poke3

poke4 = Pokemon.create(pokemon1)
user2.pokemons << poke4
event2.pokemons << poke4
