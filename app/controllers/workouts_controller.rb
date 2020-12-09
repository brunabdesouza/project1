class WorkoutsController < ApplicationController
  def new
  end

  def create

  end

  def index

    @workouts = Workout.all

  end

  def show

    @workout = Workout.find params[:id]

  end

  def edit

    @workout = Workout.find params[:id]
    redirect_to login_path unless @workout.user_id = @current_user.id

  end

  def update

    workout = Workout.find params[:id]

    if workout.user_id != @current_user.id
      redirect_to login_path
    end # if condition

    workout.update workout_params
    redirect_to workout_path

  end

  def destroy
  end


  def workout

    params.require(:workout).permit(:workout_type)

  end # workout


end # WorkoutController
