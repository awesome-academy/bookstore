class Author < ApplicationRecord
  has_many :author_details, dependent: :destroy
  has_many :books, through: :author_details
  accepts_nested_attributes_for :author_details

  scope :check_author_name, ->(name_check) {where("name LIKE ?", "#{name_check}")}
  scope :order_by_name, ->(name_search) {where("name like ?", "%#{name_search}%")}
end
