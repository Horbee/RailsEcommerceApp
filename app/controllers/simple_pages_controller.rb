class SimplePagesController < ApplicationController

  def contact
  end

  def about
  end

  def landing_page
    @featured_products = Product.order("id").limit(3)
  end

end
