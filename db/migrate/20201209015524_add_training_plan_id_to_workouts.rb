class AddTrainingPlanIdToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :training_plan_id, :integer
  end
end
