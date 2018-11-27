class Admin::BooksController < Admin::BaseController
  before_action :load_book, only: %i(edit update)
  before_action :load_categories, :load_authors, only: %i(new edit)

  def index
    @books = Book.order_by_created.search(params[:search]).page(params[:page])
      .per Settings.book.per_page
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.author_ids = params[:book][:author_ids]

    if @book.save
      flash[:success] = t ".created_success"
      redirect_to admin_books_path
    else
      flash[:danger] = t ".created_fail"
      render :new
    end
  end

  def edit
  end

  def update
    @book.author_ids = params[:book][:author_ids]

    if @book.update book_params
      flash[:success] = t ".updated_success"
      redirect_to admin_books_path
    else
      flash[:danger] = t ".updated_fail"
      render edit
    end
  end

  def destroy
    @book = Book.find_by id: params[:id]
    if @book.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".deleted_fail"
    end
    redirect_to admin_books_url
  end

  private

  def book_params
    params.require(:book).permit :title, :publisher, :price, :quantity_in_store,
      :image, :description, :category_id, :author_ids
  end

  def load_book
    @book = Book.find_by id: params[:id]

    return if @book
    flash[:danger] = t ".book_not_found"
    redirect_to admin_books_url
  end

  def load_categories
    @categories = Category.select_categories
  end

  def load_authors
    @authors = Author.select_author
  end
end
