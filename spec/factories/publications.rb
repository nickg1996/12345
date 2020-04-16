# frozen_string_literal: true

FactoryBot.define do
  factory :publication do
    sequence(:title) { |n| "title_#{n}" }
  end
end
