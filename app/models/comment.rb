class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :content, presence: true

  scope :order_by_created, -> {order created_at: :desc}
  delegate :name, :to => :user, :prefix => true
end
