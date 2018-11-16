class Admin::XmlsController < Admin::BaseController

  def index
    @books = Book.order_by_created.all
    respond_to do |format|
      format.html
      format.xls { send_data @books.to_xls(col_sep: "\t") }
    end
  end
end
