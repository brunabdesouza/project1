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

Exercise.destroy_all

exercise1 = Exercise.create! exercise_type: 'Run'
exercise2 = Exercise.create! exercise_type: 'Squats'
exercise3 = Exercise.create! exercise_type: 'Yoga'
exercise4 = Exercise.create! exercise_type: 'Tree Pose'

puts "created #{Exercise.count} exercises."

workout1.exercises << exercise1
workout2.exercises << exercise2
workout3.exercises << exercise3
workout4.exercises << exercise4

puts "Testing workouts -< exercise associations:"
puts "The exercise '#{Exercise.first.exercise_type}' belongs to the workout #{Workout.first.workout_type}"
puts "The workout type #{Workout.first.workout_type} has exercise: '#{Exercise.first.exercise_type}' "
puts "The workout type #{Workout.last.workout_type} has exercise: '#{Exercise.last.exercise_type}' "

print "Creating users..."

User.destroy_all

user1 = User.create! email: 'bruna@gym.com', password: 'chicken', name: 'Bruna'
user2 = User.create! email: 'marc@gym.com', password: 'chicken', name: 'Marc'
user3 = User.create! email: 'elisa@gym.com', password: 'chicken', name: 'Elisa'
user4 = User.create! email: 'hugo@gym.com', password: 'chicken', name: 'Hugo'

puts "created #{User.count} users."

print "Creating training plans..."

TrainingPlan.destroy_all

tplan1 = TrainingPlan.create! title: 'Weekly Workout', goal: 'Workout four times a week'
tplan2 = TrainingPlan.create! title: 'Burning Abs', goal: 'Lose fat to show abs'
tplan3 = TrainingPlan.create! title: 'Running', goal: 'Run a marathon'
tplan4 = TrainingPlan.create! title: 'Yoga Relax', goal: 'Practice yoga for stress relief'

puts "created #{TrainingPlan.count} training plans."


puts "Testing training plans >--< workouts associations "
tplan1.workouts << workout1 << workout3
tplan2.workouts << workout2
tplan3.workouts << workout4 << workout1
tplan4.workouts << workout3


puts "Testing users -< training_plan associations:"
user1.training_plans << tplan1
user2.training_plans << tplan2
user3.training_plans << tplan2
user4.training_plans << tplan3 << tplan4

puts "The user #{User.first.name} has the training plan: #{User.first.training_plans.pluck(:title)}"
puts "The user #{User.last.name} has the training plan: #{User.last.training_plans.pluck(:title)}"

puts "The training plan #{TrainingPlan.last.title} belongs to #{User.last.name}."
