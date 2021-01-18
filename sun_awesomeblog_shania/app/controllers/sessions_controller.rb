class SessionsController < ApplicationController
# In case of question for Cookie or Session
  # Cookies stores information such as user preferences,
  # while cache will keep resource files such as audio, video or flash files.
  # If it finds the cookie (in the client side), it doesn't create new session (in server side)
  # otherwise it will create again a new session.

  def new
    # This purpose is only for View page
    # No need to jump through many links, so don't put anything here :)
    render 'new'
  end

  def create
    # Find the user by their email and add the session to a cookie
    user = User.find_by(email: params[:session][:email].downcase)
    # Log the user in and redirect to the user's show page.
    if user && user.authenticate(params[:session][:password])
      # We can then redirect either to the page they were trying to access but was forwarded to LOGIN pg
      # or, if it’s nil , to the user’s profile
      forwarding_url = session[:forwarding_url]
      reset_session                    # reset_session is the new Rails 6 method used to reset the session for security
      log_in user
      flash.now[:success] = "Login successful!"
      # Redirects to their desired pg || their profile if there's none
      redirect_to forwarding_url || user
    else
      # Creates an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
