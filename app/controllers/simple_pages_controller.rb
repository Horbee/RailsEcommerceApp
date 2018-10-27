class SimplePagesController < ApplicationController
	layout "products"
  def index
  end

  def contact
  end

  def about
  end

  def landing_page
    @featured_products = Product.limit(3)
    # render layout: "products"
  end
end
