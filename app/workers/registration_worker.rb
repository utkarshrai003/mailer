class RegistrationWorker

	include Sidekiq::Worker

	sidekiq_options queue: "registration"
	sidekiq_options :retry => 2

	def perform(id)
		user = User.find(id)
		UserMailer.signup_confirmation(user).deliver_now
	end

end