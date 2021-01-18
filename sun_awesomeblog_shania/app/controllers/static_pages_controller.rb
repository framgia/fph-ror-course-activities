class StaticPagesController < ApplicationController
  before_action :user

  def home
    # @micropost = current_user.microposts.build if logged_in?
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def contact
  end
end
