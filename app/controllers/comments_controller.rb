# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable
    else
      redirect_back(fallback_location: root_path, notice: t('controllers.common.comment_error'))
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
