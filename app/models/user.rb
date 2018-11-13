class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
	has_many :orders
	has_many :comments

	validates :first_name, presence: true
	validates :last_name, presence: true
end
