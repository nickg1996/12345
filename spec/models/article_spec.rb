# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of :title }
  it { should belong_to :user }
  it { should belong_to :publication }
  it { should have_many :comments }
end
