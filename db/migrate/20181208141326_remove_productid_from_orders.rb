class RemoveProductidFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :product_id
    add_reference :cart_line_items, :order, index: true
    add_foreign_key :cart_line_items, :orders
    drop_table :line_items
  end
end
