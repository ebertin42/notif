class User < ActiveRecord::Base
	def create
		puts "In user"
		@user = User.new(user_params)
		if @user.save
			puts "In it"
			UserMailer.welcome_email(@user).deliver_now
		end
	end
end
