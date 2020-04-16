# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'uniquneess' do
    before do
      Subscription.create(user_id: 1, publication_id: 1)
    end

    subject { Subscription.new(user_id: 1, publication_id: 1) }

    it 'does not create duplicate subscription' do
      expect do
        subject.save
      end.not_to change(Subscription, :count)
    end
  end

  it { should belong_to :publication }
  it { should belong_to :user }
end
