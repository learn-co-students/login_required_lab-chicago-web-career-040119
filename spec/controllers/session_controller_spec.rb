require 'rails_helper'

RSpec.describe SessionsController do
  describe 'create' do
    it 'redirects to login page if :current_user is nil' do
      post :create
      expect(response).to redirect_to controller: 'sessions', action: 'new'
    end

    it 'redirects to login page if :current_user is empty' do
      post :create, name: ''
      expect(response).to redirect_to controller: 'sessions', action: 'new'
    end

    it 'sets session[:current_user] if :current_user was given' do
      me = 'Werner Brandes'
      post :create, current_user: me
      expect(@request.session[:current_user]).to eq me
    end
  end

  describe 'destroy' do
    it 'leaves session[:current_user] nil if it was not set' do
      post :destroy
      expect(@request.session[:current_user]).to be nil
    end

    it 'clears session[:current_user] if it was set' do
      post :create, current_user: 'Trinity'
      expect(@request.session[:current_user]).to_not be nil
      post :destroy
      expect(@request.session[:current_user]).to be nil
    end
  end
end
