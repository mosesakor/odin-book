class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def friends
    @user = User.find(params[:user_id])
    @friends = @user.friends
  end

  def friend_requests
    @user = current_user
    @friend_requests = @user.pending_friends
  end
end
