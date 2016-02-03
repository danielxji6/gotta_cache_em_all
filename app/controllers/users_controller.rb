class UsersController < ApplicationController
	before_action :logged_in?, :set_user, only: [:show, :edit, :update, :delete_team]

	def index
		if admin?
			@users = User.where(admin: true)
			@user = User.new
		else
			redirect_to events_path
		end
	end

	def create_admin
		if admin?
			user = User.find_by(username: params[:username])
			if user
				user.update_attribute(:admin, !user.admin)
				if user.admin
					flash[:notice] = 'Successfully added admin.'
				else
					flash[:notice] = 'Successfully removed admin.'
				end
			else
				flash[:error] = 'User not found, please try again.' 
			end
			redirect_to users_path
		else
			redirect_to events_path
		end
	end


	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:full_name, :username, :email, :password)
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Successfully created account!"
			login(@user)
			if session[:catch_data]
				redirect_to catch_path(session[:catch_data])
				session[:catch_data] = nil
			else
				redirect_to events_path
			end
		else
			flash[:error] = @user.errors.full_messages.join(", ")
			redirect_to signup_path
		end
	end

	def show
		@pokemons = @user.pokemons
		@team = @pokemons
			.select { |poke| poke.team_position }
			.sort { |x, y| x.team_position <=> y.team_position}
	end

	def edit
		@pokemons = @user.pokemons
		@team = @pokemons
			.select { |poke| poke.team_position }
			.sort_by { |x| x.team_position }
	end

	def update
		poke1 = Pokemon.find_by_id(params[:team_poke]) || params[:empty_position]
		poke2 = Pokemon.find_by_id(params[:backpack_poke])

		if params[:empty_position]
			poke2.team_position = poke1
			if poke2.save
				respond_to do |format|
					format.json { head :ok }
				end
			end
		else
			poke2.team_position = poke1.team_position
			poke1.team_position = nil
			if poke1.save && poke2.save
				respond_to do |format|
					format.json { head :ok }
				end
			end
		end
	end

	def delete_team
		@user.pokemons.each do |pokemon|
			pokemon.team_position = nil
			pokemon.save
		end
		redirect_to edit_user_path(current_user)
	end

	private

	def set_user
		user_id = params[:id] || current_user.id
		@user = User.find_by_id(user_id)
	end

end
