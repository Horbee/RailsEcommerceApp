module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_user, UserType, null: false do
      description "This is a user from the db"
      #argument :id, ID, required: true
    end
    def current_user
      #User.find(id)
      context[:current_user]
    end

    field :cart, CartType, null: false do
      description "Returns the current_user's cart"
    end
    def cart
      context[:current_user].cart
    end

    field :cart_line_item, CartLineItemType, null: false do
      description "This is a CartLineItem"
      argument :id, ID, required: true
    end
    def cart_line_item(id:)
      CartLineItem.find(id)
    end

    field :cart_line_items, [CartLineItemType], null: true, description: "Returns the current_user's CLIs"
    def cart_line_items
      context[:current_user].cart.cart_line_items
    end

    field :product, ProductType, null: false do
      description "This is a product from the db"
      argument :id, ID, required: true
    end
    def product(id:)
      Product.find(id)
    end

  end
end
