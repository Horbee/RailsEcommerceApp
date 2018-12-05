class AddQuantityToCartLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_line_items, :quantity, :integer, default: 1
  end
end
