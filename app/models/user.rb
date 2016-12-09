class User < ApplicationRecord
  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
