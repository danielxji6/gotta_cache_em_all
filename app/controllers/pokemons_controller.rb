class PokemonsController < ApplicationController
	 layout "pokemon.html.erb", only: [:show]

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
		# Stores the hash info into the session to redirect from users#new/users#create
		session[:catch_data] = @hash_data
	end

	def create
		
		# Collects hash information to find the corresponding event
		hash_info = params.require(:user).permit(:hash_data)
		@event = Event.find_by(hash_info)
		
		# Checks whether the user is already logged in or submitted the login form.
		if session[:user_id] == nil
			user_params = params.require(:user).permit(:username, :password)
			@user = User.confirm(user_params)
			puts "User:::" + @user.to_s + "         Event:::" + @event.to_s
		else
			@user = User.find_by_id(session[:user_id])
		end

		# Verifies that the user and the event are both valid
		if @user && @event
			login(@user)
			# Checks to see if the user has not already collected the event.
			if Pokemon.where(user_id: @user.id, event_id: @event.id).length == 0
				poke = Pokemon.create(level: rand(@event.level_min..@event.level_max))
				@user.pokemons << poke
				@event.pokemons << poke
				redirect_to @user
		    flash[:notice] = "Successfully caught pokemon!"
	    # If already collected, redirect, do not catch, and flash a notice
		  else
		  	redirect_to @user
		  	flash[:notice] = "You've already collected this event!"
		  end
	  # If either the user or event is invalid, redirect to the catch page to try again
		else
			redirect_to catch_path(@event.hash_data)
			flash[:error] = "Invalid user credentials. Please try again."
		end
		session[:catch_data] = nil #reset 
	end
end
