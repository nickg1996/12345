# frozen_string_literal: true

class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  # Might want a unique Index on the DB table
  validates :user, uniqueness: { scope: :subscription }
end
