class PokemonsController < ApplicationController

def index
	@user = User.find_by_id(params[:user_id])
	@pokemons = @user.pokemons
end

def show
	@user = User.find_by_id(params[:user_id])
	@pokemon = Pokemon.find_by_id(params[:id])
end

end
