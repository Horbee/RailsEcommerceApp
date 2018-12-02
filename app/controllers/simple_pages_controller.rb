class SimplePagesController < ApplicationController

  def contact
  end

  def about
  end

  def landing_page
    @featured_products = Product.order("id").limit(3)
  end

  def thank_you
    @name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
    @subject = params[:subject]
  	UserMailer.contact_email(@name, @email, @subject, @message).deliver_now
  end

  def cart
    byebug
  end

end
