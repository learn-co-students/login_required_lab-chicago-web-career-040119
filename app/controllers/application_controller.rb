class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_login, :current_user

  before_action :require_login

  def hello
    redirect_to controller: 'sessions', action: 'new' unless session[:current_user]
  end

  def current_user
    session[:current_user]
  end

  private

  # def require_login
  #   return head(:forbidden) unless session.include? :current_user
  # end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless session.include? :current_user
  end

  # def current_user
  #   session[:current_user]
  # end

end
