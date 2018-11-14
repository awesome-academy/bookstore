class Admin::BooksController < Admin::BaseController
  before_action :load_book, only: %i(edit update)
  before_action :load_all_category, :load_all_author, only: %i(new edit)

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

  def load_all_category
    @categories = Category.all
  end

  def load_all_author
    @authors = Author.select_author
  end
end
