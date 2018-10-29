class Admin::BooksController < Admin::BaseController

  def index
    if params[:search]
      @books = Book.search(params[:search]).page(params[:page]).per(20)
      respond_to do |format|
      format.js
      end
    else
      @books = Book.page(params[:page]).per(20)
    end
  end
end
