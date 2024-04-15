# frozen_string_literal: true

class UsersListChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'users_list_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
