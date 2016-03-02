class SessionWorker

	include Sidekiq::Worker

	sidekiq_options queue: "session"
	sidekiq_options :retry => 2

	def perform(id)
		user = User.find(id)
		UserMailer.signin_confirmation(user).deliver_now
	end

end