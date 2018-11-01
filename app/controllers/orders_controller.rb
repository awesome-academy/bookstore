class OrdersController < ApplicationController
  before_action {flash.clear}

  def index
  end

  def show
    @order = Order.find_by id: params[:id]
  end

  def new
    @items = current_user.cart_items.page(params[:page]).per Settings.admin.book.per_page
    @order = Order.new
    @payments = Payment.all
  end

  def create
    @order = Order.new order_params
    if check_info(@order)
      flash[:danger] = t ".pls_update"
    else
      @order.save
      flash[:success] = t ".order_success"
    end
    respond_to do |format|
      format.html { redirect_to new_order_path }
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit :name, :date,
      :phone_number, :dob, :address, :payment_id, :user_id, :total
  end

  def check_info(order)
    order.name.blank? || order.dob.blank? || order.payment_id.blank? || order.address.blank? || order.phone_number.blank?
  end
end
