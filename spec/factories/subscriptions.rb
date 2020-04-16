# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    publication
    user
  end
end
