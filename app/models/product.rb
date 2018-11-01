class Product < ApplicationRecord
    has_many :orders

    def self.search(attribute, value)
    	operator = "LIKE"
    	if Rails.env.production?
    		operator = "ilike"
    	end
    	Product.where("#{attribute} #{operator} ?", "%#{value}%")
    end
end
