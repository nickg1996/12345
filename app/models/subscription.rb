# frozen_string_literal: true

class Subscription < ApplicationRecord
  extend FriendlyId
  friendly_id :uuid, use: %i[slugged finders]

  belongs_to :publication
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :publication_id
end
