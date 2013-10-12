class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      render controller: 'posts', action: 'show', id: @comment.post_id
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end