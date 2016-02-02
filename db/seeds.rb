# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = {
	full_name: "D&T",
	email: "t@t.com",
	username: "tscurrie",
	password: "123"
}

user1 = User.create(user)
user1 = User.first

event = {
	name: "Mew",
	coords: "123,123",
	category: "Phichic",
	dex_number: 151,
	description: "Mew. Mew. Mew.",
	image: "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/151.jpeg",
	level_min: 10,
	level_max: 20,
	hash_data: "123456"
}

event1 = Event.create(event)


event = {
	name: "Pikachu",
	coords: "123,123",
	category: "electric",
	dex_number: 25,
	description: "pika, pika, pika",
	image: "http://vignette2.wikia.nocookie.net/pokemon/images/0/0d/025Pikachu.png/revision/latest?cb=20140328192412",
	level_min: 10,
	level_max: 20,
	hash_data: "654321"
}

event2 = Event.create(event)


pokemon1 = {
	level: 15
}

pokemon2 = {
	level: 20,
	team_position: 1
}

pokemon3 = {
	level: 30,
	team_position: 2
}

poke1 = Pokemon.create(pokemon1)
user1.pokemons << poke1
event1.pokemons << poke1

poke2 = Pokemon.create(pokemon2)
user1.pokemons << poke2
event2.pokemons << poke2

poke3 = Pokemon.create(pokemon3)
user1.pokemons << poke3
event2.pokemons << poke3
