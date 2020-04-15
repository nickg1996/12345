# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :publication
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions
end
