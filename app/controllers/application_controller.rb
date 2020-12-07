class ApplicationController < ActionController::Base

  # This fetch_user will run before every action of every controller
  before_action :fetch_user

  def fetch_user
    # check if the user_id in the session is a real one from our database then get the object for that user and save it in @current_user that will be used by every controller
    if session[:user_id].present?

      @current_user = User.find_by id: session[:user_id]


    end # if condition

    # if we get nil from the above user lookup query, then delet the session ( invalid )
    session[:user_id] = nil unless @current_user.present?

  end # fetch_user

  def check_if_logged_in
    # if current request is coming from a user who is not logged in we redirect them to the login page
    unless @current_user.present?
      flash[:error] = "You must be logged in to perform that action."

      redirect_to login_path

    end # unless

  end # check_if_logged_in

end # ApplicationController
