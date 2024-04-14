# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 3, maximum: 100 }

  # Exemple : Created on today
  scope :created_on, ->(date) { where(created_at: date.all_day).order(created_at: :asc) }
end
