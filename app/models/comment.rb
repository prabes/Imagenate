# frozen_string_literal: true

# validates and associates Comments
class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
