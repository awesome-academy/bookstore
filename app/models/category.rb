class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  scope :select_categories, -> {select :id, :name}
end
