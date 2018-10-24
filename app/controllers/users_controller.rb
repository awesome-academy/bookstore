class UsersController < ApplicationController
  def new
    @payments = Payment.all
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

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :phone_number, :dob, :address, :avatar, :payment_id
  end
end
