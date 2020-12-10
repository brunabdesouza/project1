class TrainingPlansController < ApplicationController
  def new

    @training_plan = TrainingPlan.new

    # Any workout not connected to a training_plan will be considered a template. Workout templates are shown to the user when they create a new training_plan(as a list of checkboxes), but we make copies of them and their exercises when we create a training plan. So we never assign the workout templates to a training plan, we only make copies.
    @workout_templates = Workout.where(training_plan_id: nil)

  end

  def create

    training_plan = TrainingPlan.new training_plan_params
    training_plan.user_id = @current_user.id
    training_plan.save
    workouts_to_copy = Workout.find(params[:training_plan][:workout_ids])
    workouts_to_copy.each do |w|
      new_workout = Workout.create workout_type: w.workout_type, training_plan_id: training_plan.id
      new_workout.exercises << w.exercises
    end

    redirect_to user_path(@current_user.id)

  end

  def index

    @training_plan = TrainingPlan.find params[:id]

  end

  def show

    @training_plan = TrainingPlan.find params[:id]

  end

  def edit

    @workout_templates = Workout.where(training_plan_id: nil)
    @training_plan = TrainingPlan.find params[:id]

    redirect_to login_path unless @training_plan.user_id = @current_user.id

  end

  def update

    training_plan = TrainingPlan.find params[:id]

    if training_plan.user_id != @current_user.id
      redirect_to login_path
    end # if condition

    training_plan.update training_plan_params
    redirect_to training_plan_path

  end

  def destroy

    TrainingPlan.destroy params[:id]


    redirect_to user_path(@current_user.id)

  end

  def training_plan_params

    params.require(:training_plan).permit(:title, :goal)

  end #training_plan_params

end
