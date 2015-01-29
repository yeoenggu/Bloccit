class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    p "%%%%%%%%%%%%%%%%%%%%%%%"
      p params[:comment][:body]
    p "%%%%%%%%%%%%%%%%%%%%%%%"
    # @comment.body = parmas[:body]

    if @comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment.  Please try again."
      redirect_to [@topic, @post]
    end
  end

  #############
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
