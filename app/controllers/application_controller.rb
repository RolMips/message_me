# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :user_online?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_online?
    current_user&.online || false
  end

  def require_user
    return if user_online?

    redirect_to login_path
  end
end
