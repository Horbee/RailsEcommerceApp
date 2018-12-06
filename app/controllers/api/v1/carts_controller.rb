class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def index
    render json: @cart.cart_line_items
  end

  def create
    product = Product.find(params[:id])
    cart_line_item = @cart.add_product(product)
    render json: cart_line_item
  end

  def destroy
    @cart.remove_product(params[:id])
  end

  private
  def set_cart
    @cart = Cart.find(current_user.id)
  end

end