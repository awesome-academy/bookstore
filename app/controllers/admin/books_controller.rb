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

  def destroy
    @book = Book.find_by id: params[:id]
    if @book.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".deleted_fail"
    end
    redirect_to admin_books_url
  end
end
