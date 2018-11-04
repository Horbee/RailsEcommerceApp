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
  	UserMailer.contact_form(@name, @email, @message).deliver_now
  end

end
