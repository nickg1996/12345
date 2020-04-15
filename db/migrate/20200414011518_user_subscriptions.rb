# frozen_string_literal: true

class UserSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subscriptions do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.timestamps
    end
  end
end
