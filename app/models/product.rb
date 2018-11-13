class Product < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true

    def self.search(attribute, value)
    	operator = "LIKE"
    	if Rails.env.production?
    		operator = "ilike"
    	end
    	Product.where("#{attribute} #{operator} ?", "%#{value}%")
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
end
