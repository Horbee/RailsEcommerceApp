class CartLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def converted_total_price
    total_price.to_d / 100
  end
end
