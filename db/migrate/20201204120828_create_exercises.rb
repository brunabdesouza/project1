class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.text :exercise_type

      t.timestamps
    end
  end
end
