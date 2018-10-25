class Admin::BooksController < Admin::BaseController

  def index
    if params[:search]
      @books = Book.search(params[:search]).page(params[:page]).per(Settings.admin.book.per_page)
      respond_to do |format|
      format.js
      end
    else
      @books = Book.page(params[:page]).per(Settings.admin.book.per_page)
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

  def new
    @categories = Category.all
    @book = Book.new
    @authors = @book.authors.new
  end

  def create
    @book = Book.new book_params
    authors_params = params[:book][:authors_attributes]
    authors_params.values.each do |author_params|
      author = Author.new author_params
      author_search = Author.check_author_name(author.name).first
      if author_search != nil
        AuthorDetail.create(book_id: @book.id, author_id: author_search.id)
      end
    end

    if @book.save
      flash[:success] = t ".created_success"
      redirect_to admin_books_path
    else
      flash[:danger] = t ".created_fail"
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :price, :quantity_in_store,
      :image, :description, :category_id, authors_attributes: [:id, :name, :birthday])
  end
end
