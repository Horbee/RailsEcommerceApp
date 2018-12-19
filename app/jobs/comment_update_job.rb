class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment)
    # Do something later
    ProductChannel.broadcast_to comment.product.id, comment: render_comment(comment), average_rating: comment.product.average_rating, comment_id: comment.id
  end

  private
    def render_comment(comment)
      
      if Rails.env.production?
        renderer = ApplicationController.renderer.new(
          http_host: 'ecommercehornortest.herokuapp.com',
          https:      true,
          broadcasted: true
        )
      else
        renderer = ApplicationController.renderer.new(
          http_host: 'localhost:3000',
          https:      false,
          broadcasted: true
        )
      end
      renderer.render(partial: 'comments/comment', locals: {comment: comment})  
    end
end
