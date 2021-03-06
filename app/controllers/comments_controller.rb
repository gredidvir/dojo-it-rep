class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    byebug
    if @comment.valid? && @comment.save 
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "Comment not saved: #{@comment.errors.messages[:body].join}"
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
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

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
