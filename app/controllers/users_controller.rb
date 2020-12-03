class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = current_user
    @posts = @user.posts.paginate(page: params[:page])
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
