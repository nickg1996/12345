# frozen_string_literal: true

class DropUserSubscriptionTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_subscriptions
  end
end
