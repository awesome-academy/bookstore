class BooksController < ApplicationController
  def show
    @book = Book.find_by id: params[:id]
  end

  def index
    @books = Book.page(params[:page]).per(Settings.admin.book.per_page)
  end

end
