# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthables
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]


  has_one :profile, dependent: :destroy
  after_create :init_profile 

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy, :as => :imageable
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
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
         user = User.create(
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
    user
end
end
