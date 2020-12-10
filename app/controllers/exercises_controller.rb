class ExercisesController < ApplicationController
  def new
  end

  def create
    exercise = Exercise.new exercise_params
    exercise.user_id = @current_user.id
    exercise.save
  end

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find params[:id]
  end

  def edit
    @exercise = Exercise.find params[:id]
    redirect_to login_path unless @exercise.user_id = @current_user.id
  end

  def update
  end

  def destroy
  end

  def exercise

    parames.require(:exercise).permit(:exercise_type)

  end
end
