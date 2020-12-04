# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

print "Creating workouts..."

Workout.destroy_all

workout1 = Workout.create! workout_type: 'Endurance'
workout2 = Workout.create! workout_type: 'Strength'
workout3 = Workout.create! workout_type: 'Flexibility'
workout4 = Workout.create! workout_type: 'Balance'

puts "created #{Workout.count} workouts."

print "Creating exercises..."
