class TrainingPlansController < ApplicationController
  def index
  end

  def show
    @training_plan = TrainingPlan.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
