class Workout < ApplicationRecord

  belongs_to :training_plan, optional: true

  has_many :users, through: 'training_plans'

  has_and_belongs_to_many :exercises

end
