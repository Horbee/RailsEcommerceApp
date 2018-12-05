class Product < ApplicationRecord
    has_many :line_items
    has_many :orders, through: :line_items, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :cart_line_items
    has_many :carts, through: :cart_line_items, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    before_save :set_image_url

    def self.search(attribute, value)
    	operator = "LIKE"
    	if Rails.env.production?
    		operator = "ilike"
    	end
    	Product.where("#{attribute} #{operator} ?", "%#{value}%")
    end

    def converted_price
        self.price.to_d / 100
    end

    def highest_rating_comment
    	comments.rating_desc.first
    end

    def lowest_rating_comment
    	comments.rating_asc.first
    end

    def average_rating
        comments.average(:rating).to_f
    end

    private
    def set_image_url
        self.image_url = "placeholder.jpg" if self.image_url.empty?
    end
end
