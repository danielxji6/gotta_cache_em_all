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


event = {
	name: "Pikachu",
	coords: "123,123",
	category: "electric",
	dex_number: 25,
	description: "pika, pika, pika",
	image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwin2Lqm1tLKAhVKyGMKHehWBiIQjRwIAw&url=http%3A%2F%2Fwww.giantbomb.com%2Fpikachu%2F3005-145%2F&psig=AFQjCNFQTPAW14FbP8mGkHwaNbl5mtAjjA&ust=1454282413356541",
	level_min: 10,
	level_max: 20,
	hash_data: "123456"
}

event2 = Event.create(event)


pokemon = {
	level: 15
}

poke2 = Pokemon.create(pokemon)
user1.pokemons << poke2
event2.pokemons << poke2


poke1 = Pokemon.create(pokemon)
user1.pokemons << poke1
event1.pokemons << poke1
