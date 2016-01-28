class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:full_name, :username, :email, :password)
		@user = User.create(user_params)
		redirect_to root_path
	end

	def show
		@user = User.find_by_id(params[:id])
		
	end

end
