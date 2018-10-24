class Admin::BaseController < ApplicationController
  before_action :check_admin_user

  def check_admin_user
    redirect_to root_url unless current_user.is_admin?
  end
end
