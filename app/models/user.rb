class User < ActiveRecord::Base
	has_secure_password

	attr_accessor :email, :password, :password_confirmation
end
