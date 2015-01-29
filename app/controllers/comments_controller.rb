class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment.  Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment cannot be removed.  Try again"
      redirect_to [@post.topic, @post]
    end
  end

  #############
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
