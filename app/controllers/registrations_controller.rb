class RegistrationsController < ApplicationController

	def create
		user = User.new(create_params)
		if user.save
			RegistrationWorker.perform_async(user.id)
			redirect_to new_signin_path
		else
			render plain: "some problem"
		end
	end

	def new
		@user = User.new
	end

	private

	def create_params
		params.require(:user).permit(:email , :password)
	end

end
