class CommentsController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource
    
	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user

		respond_to do |format|
			if @comment.save
				ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @product.average_rating
	      format.html { redirect_to @product, notice: 'Review was created successfully.' }
				format.json { render :show, status: :created, location: @product }
				format.js
	    else
	      format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
	      format.json { render json: @comment.errors, status: :unprocessable_entity }
	    end
  	end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@product = @comment.product
		@comment.destroy

		respond_to do |format|
			format.html { redirect_to product, notice: 'Comment was deleted successfully.' }
			format.js
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :title, :body, :rating)
		end

end
