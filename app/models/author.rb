class Author < ApplicationRecord
  has_many :author_details, dependent: :destroy
end
