class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?
  # To handle StandardError and its sub classes
  include Error::ErrorHandler

  def current_user
    @current_user = session[:access_token] ? User.new(session[:access_token]) : nil
  end

  def user_signed_in?
    current_user ? true : false
  end
end
