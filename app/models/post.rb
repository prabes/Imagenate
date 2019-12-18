# frozen_string_literal: true

class Post < ApplicationRecord # :nodoc:
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :images, as: :imageable
  has_many :likes, dependent: :destroy
end
