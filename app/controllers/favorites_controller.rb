class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

  authorize favorite
    if favorite.save
      flash[:notice] = "Successfully added the post to your favorites."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error in favoriting the post.  Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
    if favorite.destroy
      flash[:notice] = "Successfully unfavorited..."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error in unfavoriting the post."
      redirect_to [@post.topic, @post]
    end
  end
end
