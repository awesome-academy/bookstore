class Payment < ApplicationRecord
  has_many :users
  scope :select_payments, -> {select :id, :payment_type}
end
