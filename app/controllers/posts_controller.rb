class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def show
  end

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "Post was created successfully!"
        redirect_to request.referrer
      else
        flash[:error] = 'Post creation was unsuccessful'
        redirect_to request.referrer
      end
  end

  def destroy
    @post.destroy
    redirect_to request.referrer
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
