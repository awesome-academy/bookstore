class UsersController < ApplicationController
  before_action :load_user, except: %i(create new)
  before_action :get_payments, except: :show
  before_action :authenticate_user!, only: %i(show edit update)
  before_action :correct_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".created_sucess"
      redirect_to root_url
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def show
    @payments = Payment.all
  end

  def index
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t ".updated_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end

  def index
    @books = @user.favorite_books.paginate page: params[:page] , per_page: Settings.admin.user.per_page
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :phone_number, :dob, :address, :avatar, :payment_id
  end

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".user_not_found"
    redirect_to root_url
  end

  def get_payments
    @payments = Payment.all
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end
end
