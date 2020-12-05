class User < ApplicationRecord

  has_many :training_plans, optional: true


  has_secure_password

  validates :email, presence: true, uniqueness: true
end
