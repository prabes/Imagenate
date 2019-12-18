# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Validate Comment' do
    it 'comment is invalid without body' do
      comment = Comment.new(body: nil)
      expect(comment).to_not be_valid
    end
  end

  context 'Associations' do
    it { should belong_to :user }
  end
end
