class TrainingPlan < ApplicationRecord

  has_and_belongs_to_many :workouts

  belongs_to :user, optional: true
end
