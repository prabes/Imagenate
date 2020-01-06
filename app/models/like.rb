# frozen_string_literal: true

class Like < ApplicationRecord #:nodoc:
  belongs_to :post
  belongs_to :user
end
