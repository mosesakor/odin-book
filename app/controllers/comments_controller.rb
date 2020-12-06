class CommentsController < ApplicationController
  before_action :find_post, only: :create
  #before_action :correct_user, only: :destroy

  def create
    @post = Post.find(params[:comment][:post_id])
    @comments = @post.comments
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to request.referrer
    else
      flash[:alert] = 'Error'
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def find_post
    @post = Post.find(params[:comment][:post_id])
  end

  #def correct_user

  #end
end
