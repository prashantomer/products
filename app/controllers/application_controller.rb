class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
  helper_method :current_user_session, :current_user

  protect_from_forgery with: :exception
  
	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, :alert => exception.message
  end
end
