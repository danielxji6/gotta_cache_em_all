class Event < ActiveRecord::Base
	has_many :pokemons
	has_many :users, through: :pokemons
end
