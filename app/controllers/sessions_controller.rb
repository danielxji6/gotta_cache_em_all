class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to events_path
		end
		@user = User.new
	end

	def create
		# TODO: turn this below into a private method
		user_params = params.require(:user).permit(:username, :password)
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to events_path
	    flash[:notice] = "Successfully logged in"
		else
			redirect_to login_path
			flash[:error] = "Invalid credentials. Please try again."
		end
	end

	def destroy
		logout
		redirect_to root_path
	end

end
