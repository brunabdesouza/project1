class User < ApplicationRecord

  has_many :training_plans

  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :name, length: { minimum: 2 }
end
