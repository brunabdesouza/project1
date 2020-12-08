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
  end

  def update
  end

  def destroy
  end
end
