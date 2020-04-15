# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :publication, foreign_key: true

      t.timestamps
    end
  end
end
