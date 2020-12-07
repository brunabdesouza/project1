class TrainingPlansController < ApplicationController
  def new
    @training_plan = TrainingPlan.new
  end

  def create
  end

  def index
  end

  def show
    @training_plan = TrainingPlan.find params[:id]
  end

  def edit
    
  end

  def update
  end

  def destroy
  end
end
