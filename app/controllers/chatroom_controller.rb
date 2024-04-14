# frozen_string_literal: true

class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.created_on(Time.zone.today)
    @users = User.all
  end
end
