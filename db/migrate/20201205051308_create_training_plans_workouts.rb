class CreateTrainingPlansWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :training_plans_workouts do |t|
      t.integer :training_plan_id
      t.integer :workout_id
    end
  end
end
