class Api::V1::ProductsController < ApplicationController

  # GET /api/v1/products
  def index
    @products = Product.all
    render json: @products.to_json( :only => [:id, :name, :description, :colour, :price, :image_url] )
  end

  # GET /api/v1/products/1
  def show
    @product = Product.find(params[:id])
    render json: @product.to_json( :only => [:id, :name, :description, :colour, :price, :image_url] )
  end

end