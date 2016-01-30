class PokemonsController < ApplicationController

	def index
		@user = User.find_by_id(params[:user_id])
		@pokemons = @user.pokemons
	end

	def show
		@user = User.find_by_id(params[:user_id])
		@pokemon = Pokemon.find_by_id(params[:id])
	end

	def new
		@hash_data = params[:hash_data]
		@user = User.new
		@event = Event.find_by(hash_data: @hash_data)
	end

	def create
		user_params = params.require(:user).permit(:username, :password)
		hash_info = params.require(:user).permit(:hash_data)
		# puts hash_info.hash_data
		@event = Event.find_by(hash_info)
		@user = User.confirm(user_params)
		puts "User:::" + @user.to_s + "         Event:::" + @event.to_s
		if @user && @event
			login(@user)
			poke = Pokemon.create(level: rand(@event.level_min..@event.level_max))
			@user.pokemons << poke
			@event.pokemons << poke
			redirect_to @user
	    	flash[:notice] = "Successfully caught pokemon!"
		else
			redirect_to login_path
			flash[:error] = "Invalid credentials. Please try again."
		end
	end

end
