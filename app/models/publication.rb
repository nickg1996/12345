# frozen_string_literal: true

class Publication < ApplicationRecord
  belongs_to :article
end
