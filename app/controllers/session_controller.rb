class SessionController < ApplicationController

  def new
  end

  def create

    # 1. Check if the email address entered is in the database
    user = User.find_by email: params[:email]

    # 2. Did we find a user for that email? If we found the user was the password correct?
    if user.present? && user.authenticate( params[:password])
      #credentials were correct - login successful

     # Create a special system variable called 'session' to be remembered across requests
     session[:user_id] = user.id

     redirect_to user

    else

      # If one of the conditions above weren't met then show the user an error
      flash[:error] = 'Invalid email or password'

      redirect_to login_path

    end #login Check

  end # create

  def destroy

    session[:user_id] = nil  #log out user
    redirect_to login_path

  end # destroy
end # SessionController
