FactoryBot.define do
  factory :cart_line_item, class: CartLineItem do
    quantity 1
    product_name product.name
    total_price 50000
  end
end
