# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def owner
    owner = self.user.email.split("@").first
  end
end
