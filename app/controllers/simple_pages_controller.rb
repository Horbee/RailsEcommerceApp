class SimplePagesController < ApplicationController
	layout "different"
  def index
  end

  def contact
  end

  def about
  end

  def landing_page
    @featured_products = Product.order("id").limit(3)
    # render layout: "products"
  end
end
