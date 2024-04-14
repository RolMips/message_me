# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  mount ActionCable.server => '/cable'
end
