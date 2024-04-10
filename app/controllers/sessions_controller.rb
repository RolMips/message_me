# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if valid_user?(user, params[:session][:password])
      login_successful(user)
    else
      login_failed
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out successfully!'
    redirect_to login_path
  end

  private

  def valid_user?(user, password)
    user&.authenticate(password)
  end

  def login_successful(user)
    session[:user_id] = user.id
    flash[:success] = 'Logged in successfully!'
    redirect_to root_path
  end

  def login_failed
    flash[:error] = 'Invalid credentials!'
    redirect_to login_path
  end

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in!'
    redirect_to root_path
  end
end
