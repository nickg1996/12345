# frozen_string_literal: true

json.extract! publication, :id, :article_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
