class UsersController < ApplicationController
  # Finding user ID made easy, this method is in app_controller
  before_action :user, only: [:show, :edit, :update]
  # User must be logged in before doing these actions
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # Only current user is allowed to access these pages
  before_action :correct_user, only: [:edit, :update]
  # Confirms an admin user
  before_action :admin_user, only: :destroy

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome to Awesome Blog!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 25)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted successfully!"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    # make an explicit call to render ,
    # in this case rendering a view called show_follow
    render 'show_follow'
    end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end

    # Before any action chosen, user must be the current user
    # Such filter is necessary for pages that need privacy
    # like the Edit Profile
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
