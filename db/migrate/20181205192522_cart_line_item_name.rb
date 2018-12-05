class CartLineItemName < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_line_items, :product_name, :string
    add_column :cart_line_items, :total_price, :integer, default: 0
  end
end
