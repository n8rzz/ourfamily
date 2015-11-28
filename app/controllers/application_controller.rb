class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :authenticate_user!

  # private

  # def correct_user(object, path)
  #   redirect_to path unless onject.user == current_user
  # end
end
