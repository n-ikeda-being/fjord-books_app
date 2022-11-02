class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable
    else
      render :new
    end
  end

  private

  def set_comment
    @comment = @commentable.comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end