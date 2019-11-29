# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_one :profile, dependent: :destroy
  after_create :init_profile

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
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
    followings.find{|user| user.id == user_id}
  end

  def init_profile 
    self.create_profile
  end
end
