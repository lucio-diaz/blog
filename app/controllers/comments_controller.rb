class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    
    respond_to do |format|
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  
end
