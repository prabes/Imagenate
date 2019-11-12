# frozen_string_literal: true

class Post < ApplicationRecord # :nodoc:
 
  belongs_to :user
  has_many :comments
  has_many :images, as: :imageable 
end
