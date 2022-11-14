# frozen_string_literal: true

class FollowsController < ApplicationController
  # フォローする
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # アンフォロー
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

end
