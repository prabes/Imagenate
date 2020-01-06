# frozen_string_literal: true

class Profile < ApplicationRecord #:nodoc:
  belongs_to :user
  has_one :image, as: :imageable
end
