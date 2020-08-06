class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :main_image
  validates :main_image, presence: true
end
