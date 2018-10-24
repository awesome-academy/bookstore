class Book < ApplicationRecord
  has_many :comments
  has_many :emotions, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :author_details dependent: :destroy
  has_many :authors, through: :authors_details
  belongs_to :category
end
