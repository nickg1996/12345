# frozen_string_literal: true

class AddSlugToPublicationsAndSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :uuid, :string, unique: true, index: true
    add_column :publications, :slug, :string, unique: true, index: true

    add_column :subscriptions, :uuid, :string, unique: true, index: true
    add_column :subscriptions, :slug, :string, unique: true, index: true

    Publication.all.each do |publication|
      uuid = SecureRandom.uuid
      publication.update_column(:uuid, uuid)
      publication.update_column(:slug, uuid)
    end

    Subscription.all.each do |subscription|
      uuid = SecureRandom.uuid
      subscription.update_column(:uuid, uuid)
      subscription.update_column(:slug, uuid)
    end
  end
end
