class Cart < ApplicationRecord
  has_many :cart_line_items, dependent: :destroy
  has_many :products, through: :cart_line_items

  def add_product(product)
    current_product = cart_line_items.find_by(product_id: product.id)
    if current_product
      current_product.increment(:quantity)
      current_product.total_price = current_product.quantity * product.price
    else
      current_product = cart_line_items.build(product_name: product.name, product_id: product.id, total_price: product.price)
    end
    current_product.save
  end

  def remove_product(id)
    current_product = cart_line_items.find(id)

    if current_product.quantity == 1
      current_product.destroy
    elsif current_product.quantity > 1
      current_product.decrement(:quantity)
      current_product.total_price = current_product.quantity * current_product.product.price
      current_product.save
    end
  end
  
  
end
