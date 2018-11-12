class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate params[:session][:password]
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget_user(user)
      session[:forwarding_url]
      if user.is_admin
        redirect_back_or admin_books_path
      else
        redirect_back_or user
      end
    else
      flash.now[:danger] = t ".require_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
