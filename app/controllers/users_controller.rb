class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def index
		@users = User.all
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
			redirect_to @user
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
			.sort { |x, y| x.team_position <=> y.team_position}
	end

	def update
		puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
		p params
		# poke_one = params[:]
		# redirect_to user_path(@user)
	end

	private

	def set_user
		@user = User.find_by_id(params[:id])
	end

end
