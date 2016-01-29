class User < ActiveRecord::Base

	has_secure_password

	def self.confirm(params)
		@user = User.find_by({username: params[:username]})
		@user.try(:authenticate, params[:password])
	end

	validates :full_name, :username, :email, :password, presence: true, length: {maximum: 255}

	validates :email, :username, uniqueness: true

	validates :email, format: { with: /@/ }

end
