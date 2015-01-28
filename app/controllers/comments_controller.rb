class CommentsController < ApplicationController
  def create
     @post = current_user.posts.build(post_params)
     @comment = Comment.new
     @comment.body = comment_params
  end


  #############
  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def comment_params
    params.require(:post).permit(:title, :body, :image)
  end
end
