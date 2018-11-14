class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books

  scope :check_author_name, ->(name_check) {where("name LIKE ?", "#{name_check}")}
  scope :select_author, -> {select :id, :name}
end
