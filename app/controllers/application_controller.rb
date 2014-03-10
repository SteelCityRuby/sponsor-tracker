class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :ensure_authenticated

  def ensure_authenticated
    return if browserid_authenticated?
    return if params[:controller] == 'welcome' || params[:controller] == 'sessions'
    redirect_to root_url
  end
end
