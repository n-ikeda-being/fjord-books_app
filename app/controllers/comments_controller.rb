class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    comment.save
  end

  def destroy
    comment = Comment.find_by(id: params[:id], report_id: params[:report_id])
    comment.destroy
    redirect_to report_path(comment.report)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, report_id: params[:report_id])
  end
end