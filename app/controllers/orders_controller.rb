class OrdersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
        @orders = Order.user_related(current_user)
    end

    def show
        @order = Order.find(params[:id])
    end

    def create
        product = Product.find(params[:product])

        if Order.create(user_id: current_user.id, product: product, total: product.price).save
            redirect_to orders_path
        end
    end

    def new
    end

    def destroy
        if Order.find(params[:id]).destroy
            redirect_to orders_path
        end
    end

end