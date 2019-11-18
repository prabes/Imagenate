# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :post, dependent: :destroy

  def owner
    owner = self.user.email.split("@").first
  end
end
