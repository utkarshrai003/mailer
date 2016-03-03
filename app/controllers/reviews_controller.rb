class ReviewsController < ApplicationController
	
	def new
		 @review = Review.new
	end

	def create
		debugger
		review  = Review.new(create_params)
		review.save
		uploaded_io = params[:review][:picture]
  		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
  end
		render json: review
	end

	private

	def create_params
		debugger
		params.require(:review).permit(:name , :review , :product)
	end
end
