class PostsController < ApplicationController
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
        flash[:error] = 'post creation was unsuccessful'
        redirect_to request.referrer
      end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
