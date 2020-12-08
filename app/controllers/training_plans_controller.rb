class TrainingPlansController < ApplicationController
  def new

    @training_plan = TrainingPlan.new

  end

  def create

    training_plan = TrainingPlan.new training_plan_params
    training_plan.user_id = @current_user.id
    training_plan.save

    redirect_to user_path(@current_user.id)

  end

  def index

    @training_plan = TrainingPlan.find params[:id]

  end

  def show

    @training_plan = TrainingPlan.find params[:id]

  end

  def edit

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

    @training_plan = TrainingPlan.destroy params[:id]
    @training_plan.destroy training_plan_params
    redirect_to training_plans_path

  end

  def training_plan_params

    params.require(:training_plan).permit(:title, :goal)

  end #training_plan_params

end
