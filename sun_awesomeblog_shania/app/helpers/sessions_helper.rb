module SessionsHelper
	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns the current logged-in user (if any).
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	# Returns true if the given user is the current user.
	def current_user?(user)
		user && user == current_user
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	# Logs out the current user
	def logout
		reset_session
		@current_user = nil
	end

	# Stores the URL trying to be accessed
	# Ex. User wants to access Edit Profile but not logged in
	# User will be led to Login pg but after user logs in
	# User will go directly to Edit Profile
	# This is called, "Friendly Forwarding" -> in the book it's called, "store_location"
	def last_location
		session[:forwarding_url] = request.original_url if request.get?
	end
end
