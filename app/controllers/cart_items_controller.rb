class CartItemsController < ApplicationController
  before_action {flash.clear}
  def index
    @items = current_user.cart_items.page(params[:page]).per Settings.admin.book.per_page
    @payments = Payment.all
  end

  def destroy
    current_user.cart_items.find_by(params[:id]).delete
    @items = current_user.cart_items.page(params[:page]).per Settings.admin.book.per_page
    flash[:success] = t ".success"
    respond_to do |format|
      format.html { redirect_to cart_items_path }
      format.js
    end
  end

  def create
    @cart_item = CartItem.new cart_item_params
    @item = CartItem.find_by book_id: cart_item_params[:book_id]
    if @item
      @item.update_attributes cart_item_params
      flash[:success] = t ".update"
    else
      @cart_item.save
      flash[:success] = t ".add"
    end
    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit :book_id, :user_id, :quantity, :paideach
  end
end
