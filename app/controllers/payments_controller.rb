class PaymentsController < ApplicationController

    # POST for cart checkout
    def create
        token = params[:stripeToken]
        @email = params[:stripeEmail]
        @cart = Cart.find(params[:cart_id])
        @price = @cart.price
        begin
            charge = Stripe::Charge.create(
                amount: @price, # in cents
                currency: "eur",
                source: token,
                description: @email
            )
            
            if charge.paid
                @order = Order.create(user: current_user, total: @price)
                @cart.cart_line_items.each do |item| 
                    item.order_id = @order.id
                    item.cart = nil
                    item.save
                end
                UserMailer.order_received_email(@email, current_user.first_name, @order).deliver_now
                flash[:notice] = "Your payment was processed successfully"
            end

        rescue Stripe::CardError => exception
            # The card has been declined
            body = e.json_body
            err = body[:alert]
            flash[:alert] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end

        # !!rewrite
        redirect_to after_payments_path
    end

    # GET
    def after
    end

end
