class Book < ApplicationRecord
  has_many :comments
  has_many :likes_from_users, class_name: Emotion.name, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  has_many :cart_items, dependent: :destroy
  has_many :author_details, dependent: :destroy
  has_many :authors, through: :author_details
  belongs_to :category
  accepts_nested_attributes_for :authors,
    reject_if: proc {|attributes| attributes[:name].blank? ||
      Author.check_author_name(attributes[:name]).length != 0},
      allow_destroy:true
  mount_uploader :image, PictureUploader

  scope :order_by_created, -> {order created_at: :desc}
  scope :select_book, -> {select :id, :title, :price, :description}
  scope :search, (lambda do |title|
    where("title LIKE ?", "%#{title}%") unless title.nil?
  end)
  scope :filter_by_book_type, -> category_name {Book.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}
end
