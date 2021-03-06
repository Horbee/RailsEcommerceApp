class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
	validates :title, presence: true
	validates :body, presence: true
	validates :user, presence: true
	validates :product, presence: true
	validates :rating, numericality: { only_integer: true }
  
  after_create_commit { 
    CommentUpdateJob.perform_later(self) 
  }
  # scopes: run on the model and return an array
  # method: runs on a single record
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  paginates_per 3
end
