module Types
  class CartType < Types::BaseObject
    field :user_id, ID, null: true
    field :cart_line_items, [CartLineItemType], null: true
    field :products, [ProductType], null: true
    field :price, Int, null: false
  end
end
