class User < ApplicationRecord
  has_many :comments dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_naem: Relationship.name
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :emotions, dependent: :destroy
  has_one :cart, dependent: :destroy
  belongs_to :payment
  before_save :email_downcase
  validates :name, presence: true,
    length: {maximum: Settings.user.max_name_size}
  validates :email, presence: true,
    length: {maximum: Settings.user.max_email_size},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  private

  def email_downcase
    email.downcase!
  end
end
