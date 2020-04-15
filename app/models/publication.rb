# frozen_string_literal: true

class Publication < ApplicationRecord
  extend FriendlyId
  friendly_id :uuid, use: %i[slugged finders]
  belongs_to :article
end
