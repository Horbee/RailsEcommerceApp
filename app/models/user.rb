class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
	
	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one_attached :avatar

	validates :first_name, presence: true
	validates :last_name, presence: true
	validate :correct_image_type

	@@cart = []

	def cart
		return @@cart
	end

	def add_item_to_cart(product)
		@@cart.push(product)
	end

	def remove_item_from_cart(product)
		@@cart.delete(product)
	end

	private
	def correct_image_type
		if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
			errors.add(:avatar, 'must be a jpeg or png')
			avatar.purge
		end
	end
end
