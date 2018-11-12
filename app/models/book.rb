class Book < ApplicationRecord
  has_many :comments
  has_many :likes_from_users, class_name: Emotion.name, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  has_many :cart_items, dependent: :destroy
  has_many :users_added_to_cart, through: :cart_items, source: :user, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  belongs_to :category
  mount_uploader :image, PictureUploader

  scope :order_by_created, -> {order created_at: :desc}
  scope :select_book, -> {select :id, :title, :price, :description}
  scope :search, (lambda do |title|
    where("title LIKE ?", "%#{title}%") unless title.nil?
  end)
  scope :filter_by_book_type, -> category_name {Book.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}

  def self.to_xls(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |book|
        csv << book.attributes.values_at(*column_names)
      end
    end
  end
end
