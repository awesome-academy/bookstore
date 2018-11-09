class BooksController < ApplicationController
  before_action :load_book, only: :show

  def show
    @comment = Comment.new
    @comments = @book.comments.order_by_created
  end

  def index
    @books = Book.select_book.order_by_created.page(params[:page])
      .per Settings.book.per_page
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
  end
end
