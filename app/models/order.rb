class Order < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates :total, presence: :true


    def self.user_related(user)
    	user.orders.includes(:product).order(id: :desc)
    end
end