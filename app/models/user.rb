# frozen_string_literal: true

class User < ApplicationRecord
  devise :registerable,
         :rememberable,
         :trackable,
         :validatable,
         :database_authenticatable, authentication_keys: [:nickname]

  include DeviseTokenAuth::Concerns::User

  validates :nickname, presence: true, uniqueness: true, length: { in: 3..50 }
  validates_confirmation_of :password
  
  has_many :projects, dependent: :destroy
end
