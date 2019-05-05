require "pry"

class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new
    
  end

  def create
    # return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
    #binding.pry
    if !params[:current_user] || params[:current_user].empty?
      return redirect_to(controller: 'sessions', action: 'new')
    end

    session[:current_user] = params[:current_user]
    redirect_to controller: 'application', action: 'hello'
  end

  def destroy
    session.delete :current_user
    redirect_to controller: 'application', action: 'hello'
  end


end
