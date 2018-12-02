class Order < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    belongs_to :user
    validates :total, presence: :true


    def self.user_related(user)
    	user.orders.includes(:product).order(id: :desc)
    end
end