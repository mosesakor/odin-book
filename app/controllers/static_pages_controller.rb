class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @post = current_user.posts.build
    @hmm =  "#{current_user.first_name} #{current_user.last_name }"
    @likes = Like.all
    @timeline_content = current_user.timeline.paginate(page: params[:page])
    @comment = Comment.new
    @comments = Comment.all
    
  end

  def about
  end

  private
  
 # def comment_params
  #  params.require(:comment).permit(:body, :post_id)
  #end

end
