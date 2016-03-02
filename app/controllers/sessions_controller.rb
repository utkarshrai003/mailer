class SessionsController < ApplicationController

	before_action :set_user , only: [:update]
	
	def create
		user = User.find_by(email: params[:user][:email])
		if user && user[:password] == params[:user][:password]
			SessionWorker.perform_async(user.id)
			render plain: "confirmation mail sent"
		else
			render plain: "invalid"
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.new 
	end

	def update
		@user.update(update_params)
		render json: @user
	end

	private

	def update_params
		params.require(:user).permit(:name , :email)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
