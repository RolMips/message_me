# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create # rubocop:disable Metrics/MethodLength
    user = User.find_by(username: params[:session][:username])
    if valid_user?(user, params[:session][:password])
      if user.online
        login_already(user)
      else
        user.online = true
        user.save ? login_successful(user) : login_failed
      end
    else
      login_error
    end
  end

  def destroy
    user = current_user
    return unless user

    user.online = false
    return unless user.save

    session[:user_id] = nil
    flash[:success] = 'Logged out successfully!'
    update_users_list
    redirect_to login_path
  end

  private

  def valid_user?(user, password)
    user&.authenticate(password)
  end

  def login_successful(user)
    session[:user_id] = user.id
    flash[:success] = 'Logged in successfully!'
    update_users_list
    redirect_to root_path
  end

  def login_failed
    flash[:error] = 'Logged in not successfully!'
    redirect_to login_path
  end

  def login_error
    flash[:error] = 'Invalid credentials!'
    redirect_to login_path
  end

  def login_already(user)
    session[:user_id] = user.id
    flash[:error] = 'You are already logged in!'
    redirect_to root_path
  end

  def logged_in_redirect
    return unless user_online?

    flash[:error] = 'You are already logged in!'
    redirect_to root_path
  end

  def update_users_list
    @users = User.online
    ActionCable.server.broadcast 'users_list_channel', { users: @users }
  end
end
