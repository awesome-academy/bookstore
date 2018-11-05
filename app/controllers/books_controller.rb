class BooksController < ApplicationController
  def show
    @book = Book.find_by id: params[:id]
    @comment = Comment.new
    @comments = @book.comments.order_by_created
  end

  def index
    @books = Book.select_book.order_by_created.page(params[:page])
      .per Settings.book.per_page
  end

end
