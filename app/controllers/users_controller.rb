class UsersController < ApplicationController

  def new
    @user = User.new
  end # new users

  def create

    @user = User.create user_params

    #did the above .create actually save to the DB or not?
    if @user.persisted?
        #log the user automatically so they dont have to enter their details again
        session[:user_id] = @user.id

        redirect_to root_path

      else
        #we won't redirect to login_path

        # we render the template for the 'new' action i.e. blank form
        render :new

    end # if condition

  end #create

  def index

    @users = User.all

  end

  def show

    @user = User.find params[:id]

  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end # user_params


end # class UsersController
