class CommentsController < ApplicationController
  respond_to :html, :js
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

  def destroy
    # @post = @topic.posts.find(params[:post_id])
    @comment = Comment.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      # redirect_to [@comment.post.topic, @comment.post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      # redirect_to [@comment.post.topic, @comment.post]
    end

    respond_with(@comment) do |format|
      format.html {redirect_to [ @post.topic, @comment.post] }
    end
  end

end
