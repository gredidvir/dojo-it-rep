class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Post marked as favorite."
      redirect_to [@post.topic, @post]
      # Add code to generate a success flash and redirect to @post
      # Remember the path shortcut: [@post.topic, @post]
    else
      flash[:error] = "There was an error marking the post as favorite. Please try again."
      # Add code to generate a failure flash and redirect to @post
      redirect_to[@post.topic, @post]
    end
  end

def destroy
  # Get the post from the params
  @post = Post.find(params[:post_id])
  # Find the current user's favorite with the ID in the params
  favorite = Favorite.find(params[:id])
  authorize favorite
  if favorite.destroy
      flash[:notice] = "Post marked as unfavorite."
      redirect_to [@post.topic, @post]
  else
      flash[:error] = "There was an error marking the post as unfavorite. Please try again."
      # Add code to generate a failure flash and redirect to @post
      redirect_to[@post.topic, @post]
  end
end
end