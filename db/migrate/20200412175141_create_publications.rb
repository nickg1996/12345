# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.belongs_to :article, foreign_key: true

      t.timestamps
    end
  end
end
