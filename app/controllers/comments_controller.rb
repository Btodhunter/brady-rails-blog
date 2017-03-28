class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if user_signed_in?
      @comment.user_id = current_user.id
      @comment.author_name = current_user.first_name
    end

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body, :user_id)
  end
end
