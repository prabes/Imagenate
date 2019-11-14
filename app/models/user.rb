# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  after_create :init_profile

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy 
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed_user
  has_many :follower_users, through: :passive_relationships, source: :follower_user 
  
  
  def init_profile 
    self.create_profile
  end
end
