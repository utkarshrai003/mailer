class ImageUploaderWorker

	include Sidekiq::Worker

	sidekiq_options queue: "image_uploads" , :retry => 2

	def perform(id)
		UserMailer.notify(id , email_was).deliver_now
	end

end