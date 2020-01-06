# frozen_string_literal: true

class User < ApplicationRecord #:nodoc:
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthables
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def followers
    follower_relationships.map { |i| User.find(i.follower_id) }
  end

  def followings
    following_relationships.map { |i| User.find(i.following_id) }
  end

  def follower_relationships
    Relationship.where(following_id: id)
  end

  def following_relationships
    Relationship.where(follower_id: id)
  end

  def followed?(user_id)
    followings.find { |user| user.id == user_id }
  end

  def request_sent?(user_id)
    requested.find { |user| user.id == user_id }
  end

  def requesters
    request_received.map { |i| User.find(i.requesting_id) }
  end

  def requested
    request_sent.map { |i| User.find(i.requested_id) }
  end

  def request_sent
    Request.where(requesting_id: id)
  end

  def request_received
    Request.where(requested_id: id)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    # Uncomment the section below if you want users to be created
    # if they don't exist
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end
end
