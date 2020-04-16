# frozen_string_literal: true

class AddUserIdToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :user, index: true, foreign_key: true

    add_index :subscriptions, %i[user_id publication_id], unique: true
  end
end
