module Types
  class MutationType < Types::BaseObject
    # CartLineItem create
    field :create_cli, CartLineItemType, null: false do
      description "Creating CLIs for the current user"
      argument :product_id, ID, required: true
      argument :quantity, Integer, required: true
    end
    def create_cli(product_id:, quantity:)
      product = Product.find(product_id)
      CartLineItem.create(
        cart: context[:current_user].cart,
        product_id: product_id,
        quantity: quantity,
        product_name: product.name,
        total_price: quantity * product.price, 
        product: product
      )
    end
    
    # CartLineItem delete
    field :delete_cli, CartLineItemType, null: true do
      description "Deleting a specific CLI"
      argument :id, ID, required: true
    end
    def delete_cli(id:)
      CartLineItem.find(id).destroy
    end

    # CartLineItem delete
    field :delete_current_clis, Boolean, null: true do
      description "Deleting all CLIs from the current cart"
    end
    def delete_current_clis
      items = context[:current_user].cart.cart_line_items.destroy_all
    end
  end
end
