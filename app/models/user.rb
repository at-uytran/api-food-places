class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
  has_many :user_ratings, dependent: :destroy
  has_many :subscribe_places, dependent: :destroy
  has_many :user_collections, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :user_notifications, dependent: :destroy
  has_one :user_settings, dependent: :destroy
  has_many :notifications, through: :user_notifications
end
