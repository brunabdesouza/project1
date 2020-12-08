class UsersController < ApplicationController

  def new
    @user = User.new
  end # new users

  def create

    @user = User.new user_params

    # check for file upload and handle upload if present
    if params[:user][:image].present?
      response = Cloudinary::Uploader.upload params[:user][:image]
      p response
      # save response ID into the appropriate field of our new model object
      @user.image = response["public_id"]
  end

    #did the above .create actually save to the DB or not?
    if @user.persisted?
        #log the user automatically so they dont have to enter their details again
        session[:user_id] = @user.id

        redirect_to user_path(@user.id)

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

    @user = User.find params[:id]


  end

  def update

    @user = User.find params[:id]

    @user.update user_params
    redirect_to user_path(@user.id)

  end

  def destroy

    @user = User.destroy params[:id]

    @user.destroy user_params
    redirect_to root_path

  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end # user_params


end # class UsersController
