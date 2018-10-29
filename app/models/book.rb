class Book < ApplicationRecord
  has_many :comments
  has_many :emotions, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :author_details, dependent: :destroy
  has_many :authors, through: :author_details
  belongs_to :category
  #mount_uploader :image, PictureUploader
  scope :search, ->(title) {where("title LIKE ?", "%#{title}%")}
end
