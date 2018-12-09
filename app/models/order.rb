class Order < ApplicationRecord
    has_many :cart_line_items, dependent: :destroy
    has_many :products, through: :cart_line_items
    belongs_to :user
    validates :total, presence: :true

    def self.user_related(user)
    	user.orders.order(created_at: :desc)
    end

    def show_date
        created_at.strftime("%d %B, %Y")
    end
end