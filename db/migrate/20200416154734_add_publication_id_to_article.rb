# frozen_string_literal: true

class AddPublicationIdToArticle < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :article_id, :integer

    add_reference :articles, :publication, index: true, foreign_key: true
  end
end
