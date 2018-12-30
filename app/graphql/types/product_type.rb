module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :image_url, String, null: true
    field :colour, String, null: true
    field :price, Integer, null: false
    field :cart_line_items, [CartLineItemType], null: true
  end
end
