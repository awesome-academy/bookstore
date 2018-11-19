class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_many :likes_from_users, class_name: Emotion.name, as: :recipent, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  validates :title, presence: true
  validates :date, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :body, presence: true

  def should_generate_new_friendly_id?
    title_changed? || super
  end

end
