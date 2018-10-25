class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :body, presence: true
end
