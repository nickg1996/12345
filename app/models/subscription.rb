# frozen_string_literal: true

class Subscription < ApplicationRecord
  extend FriendlyId
  friendly_id :uuid, use: %i[slugged finders]
  belongs_to :publication
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions
end
