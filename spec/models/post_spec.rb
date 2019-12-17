# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validates post attributes' do
    it 'validates presence of post title' do
      post = Post.create(title: nil, description: 'NOT NIL')
      expect(post).to_not be_valid
    end
    it 'validates presence of post description' do
      post = Post.create(title: 'Test Title', description: nil)
      expect(post).to_not be_valid
    end
  end

  context 'Associations' do
    it { should belong_to :user }
    it { should have_many :comments }
    it { should have_many :likes }
    it { should have_many :images }
  end
end
