class BooksController < ApplicationController
  before_action :load_book, only: :show
  before_action :load_categories, only: :index

  def show
    @comment = Comment.new
    @comments = @book.comments.order_by_created
    @cart_item = CartItem.new
  end

  def index
    @books = Book.order_by_created.filter_by_book_type(params[:category])
      .page(params[:page]).per Settings.book.per_page
    @search = Book.ransack(params[:q])
    @books = @search.result.includes(:category).page(params[:page]).per Settings.book.per_page

    if params[:book_name_search]
      @books = Book.search_by_title(params[:book_name_search]).page(params[:page]).per Settings.book.per_page
      respond_to do |format|
        format.html
        format.js {render :index}
      end
    elsif params[:term]
      @books = Book.search_by_title(params[:term]).page(params[:page]).per(Settings.book.per_page)
      render json: @books.map(&:title)
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
  end
end
