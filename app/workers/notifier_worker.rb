class NotifierWorker

	include Sidekiq::Worker

	sidekiq_options queue: "notifier"
	sidekiq_options :retry => 2

	def perform(id , email_was)
		UserMailer.notify(id , email_was).deliver_now
	end

end