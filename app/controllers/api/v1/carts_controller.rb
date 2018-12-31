class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def index
    render json: @cart.cart_line_items
  end

  def create
    product = Product.find(params[:id])
    cart_line_item = @cart.add_product(product)
    respond_to do |format|
      format.html { redirect_to simple_pages_cart_url, notice: 'Product was successfully added.' }
      format.json { render json: cart_line_item }
    end
  end 

  def destroy
    @cart.remove_product(params[:id]) #cli_id
    respond_to do |format|
      format.html { redirect_to simple_pages_cart_url, notice: 'Product was successfully removed.' }
      format.json { render json: @cart }
    end
  end

  private
  def set_cart
    @cart = current_user.cart
  end

end