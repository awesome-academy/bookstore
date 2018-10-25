class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "hello word!"
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
