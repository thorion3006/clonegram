class UserController < ApplicationController
  before_action :authenticate

  def profile
    client = Instagram.client(access_token: current_user.access_token)
    if client
      @user = client.user
    else
      redirect_to login_path
    end
    # Instagram won't give access to scope followers_list, so the below functionality won't work.
    # requests = client.user_requested_by
    # followers = client.user_followed_by
    # following = client.user_follows
    # @user.requests = requests
    # @user.followers = follower
    # @user.following = following
  end

  def dashboard
    client = Instagram.client(access_token: current_user.access_token)
    if client
      @feeds = client.user_recent_media
    else
      redirect_to login_path
    end
  end

  private

  def authenticate
    unless user_signed_in?
      redirect_to login_path
    end
  end
end
