class User < ActiveRecord::Base

	has_secure_password

	def self.confirm(params)
		@user = User.find_by({username: params[:username]})
		@user.try(:authenticate, params[:password])
	end

	validates :full_name, :email, :password, presence: true, length: {maximum: 255}
	validates :username, length: {in: 6..12, message: "must be between 6 and 12 characters"}
	validates :password, length: { minimum: 3, message: "must be at least 3 characters" }
	validates :email, :username, uniqueness: true 

	validates :email, format: { with: /@/ }, length: { minimum: 6 }

end
