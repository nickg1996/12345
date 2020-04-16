# frozen_string_literal: true

class Publication < ApplicationRecord
  extend FriendlyId
  friendly_id :custom_slug, use: %i[slugged finders]
  has_many :articles, dependent: :destroy

  validates_presence_of :title

  private

  def custom_slug
    [
      %i[uuid title]
    ]
  end
end
