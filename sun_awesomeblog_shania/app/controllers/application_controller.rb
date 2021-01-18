class ApplicationController < ActionController::Base
  # All controllers can access this file, not just Sessions
  include SessionsHelper

  # Makes the users' ID available for all controllers
  def user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  # Before any action chosen, user must be logged in first
  def logged_in_user
    unless logged_in?
      last_location
      flash[:danger] = "Please login first"
      redirect_to login_url
    end
  end

  # Application will confirm if the user is the admin
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
