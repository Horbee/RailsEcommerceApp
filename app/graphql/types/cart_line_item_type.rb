module Types
  class CartLineItemType < Types::BaseObject
    field :id, ID, null: false
    field :cart_id, ID, null: true
    field :product_id, ID, null: true
    field :quantity, Integer, null: true
    field :product_name, String, null: true
    field :total_price, Integer, null: true
    field :order_id, ID, null: true
    field :product, ProductType, null: false, description: "This returns the CLI's product"
  end
end
