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

event = {
	name: "Mew",
	coords: "123,123",
	category: "Phichic",
	dex_number: 151,
	description: "Mew. Mew. Mew.",
	image: "http://orig05.deviantart.net/23ee/f/2012/166/3/8/151_mew_sprite_by_blaze33193-d53n2y9.png",
	level_min: 10,
	level_max: 20,
	hash_data: "123456"
}

event1 = Event.create(event)

pokemon = {
	level: 15
}

poke1 = Pokemon.create(pokemon)
user1.pokemons << poke1
event1.pokemons << poke1
