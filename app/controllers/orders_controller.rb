class OrdersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
        @orders = Order.user_related(current_user)
    end

    def destroy
        if Order.find(params[:id]).destroy
            redirect_to orders_path
        end
    end

end