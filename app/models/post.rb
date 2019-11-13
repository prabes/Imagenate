# frozen_string_literal: true

class Post < ApplicationRecord # :nodoc:
 
  belongs_to :user
  has_many :comments
  has_many :images, as: :imageable 
  has_many :likes, dependent: :destroy 

  def owner
    str = self.user.email.split("@").first
  end
end
