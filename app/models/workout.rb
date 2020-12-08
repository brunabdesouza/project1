class Workout < ApplicationRecord

  has_and_belongs_to_many :training_plans

  has_many :users, through: 'training_plans'

  has_many :exercises

end
