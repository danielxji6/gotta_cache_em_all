class Event < ActiveRecord::Base
	has_many :pokemons
	has_many :users, through: :pokemons

#TODO: would validations make sense here to ensure there are no duplicate events within a location, etc? validations are cheap and easy. -jc

#TODO: move any db calls and repetitive code from the resepective controllers to the models and make them methods. We love fat models. -jc

end
