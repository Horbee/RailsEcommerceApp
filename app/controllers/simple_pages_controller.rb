class SimplePagesController < ApplicationController

  def contact
  end

  def about
  end

  def landing_page
    @featured_products = Product.order("id").limit(3)
  end

  def redirected
  	render 'temp/redirected'
  end

  def alternative
  	render 'temp/alternative'
  end
end
