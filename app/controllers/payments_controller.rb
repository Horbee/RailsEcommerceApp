class PaymentsController < ApplicationController

    # POST
    def create
        token = params[:stripeToken]
        @product = Product.find(params[:product_id])
        @email = params[:stripeEmail]
        begin
            charge = Stripe::Charge.create(
                amount: @product.price, # in cents
                currency: "eur",
                source: token,
                description: @email
            )
            
            if charge.paid
                @order = Order.create(user_id: current_user.id, product_id: @product.id, total: @product.price)
                UserMailer.order_recieved_email(@email, current_user.first_name, @order).deliver_now
                flash[:notice] = "Your payment was processed successfully"
            end

        rescue Stripe::CardError => exception
            # The card has been declined
            body = e.json_body
            err = body[:alert]
            flash[:alert] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end

        redirect_to after_payments_path(product_id: @product.id)
    end

    # GET
    def after()
        @product = Product.find(params[:product_id])
    end

end
