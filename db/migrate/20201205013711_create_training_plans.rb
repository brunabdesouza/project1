class CreateTrainingPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :training_plans do |t|
      t.text :title
      t.text :goal
      t.integer :user_id

      t.timestamps
    end
  end
end
