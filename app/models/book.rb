class Book < ApplicationRecord
  has_many :comments
  has_many :likes_from_users, class_name: Emotion.name, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  has_many :cart_items, dependent: :destroy
  has_many :author_details, dependent: :destroy
  has_many :authors, through: :author_details
  belongs_to :category
  #mount_uploader :image, PictureUploader
  scope :search, ->(title) {where("title LIKE ?", "%#{title}%")}
end
