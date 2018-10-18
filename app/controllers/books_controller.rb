class BooksController < ApplicationController
  def show
  end

  def index
    @books = Book.paginate page: params[:page] , per_page: 15
  end

end
