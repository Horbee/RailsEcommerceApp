class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # scopes: run on the model and return an array
  # method: runs on a single record

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

end
