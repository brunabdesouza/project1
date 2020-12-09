class TrainingPlan < ApplicationRecord

  has_many :workouts, dependent: :destroy

  belongs_to :user, optional: true
end
