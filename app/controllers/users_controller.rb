class UsersController < ApplicationController

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
		@user = User.find_by_id(params[:id])
		@pokemons = @user.pokemons
	end

end
