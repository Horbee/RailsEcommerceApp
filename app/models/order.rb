class Order < ApplicationRecord
    belongs_to :product
    belongs_to :user

    def self.user_related(user)
    	user.orders.includes(:product).order(id: :desc)
    end
end