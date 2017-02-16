class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    # @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post = Post.find(params[:post_id])
    @comment.post = @post

    # authorize @post
    if @comment.save
      flash[:notice] = "Comment was updated."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
