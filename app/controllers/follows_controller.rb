# frozen_string_literal: true

class FollowsController < ApplicationController
  # フォローする
  def create
    user = params[:user_id]
    if current_user.follow(user)
      redirect_to user_path(user), notice: 'フォローしました'
    else
      redirect_to  user_path(user), alert: 'フォローできませんでした（既にフォローしている可能性があります）'
    end
  end

  # アンフォロー
  def destroy
    user = params[:user_id]
    if current_user.unfollow(user)
      redirect_to user_path(user), notice: 'フォローを解除しました'
    else
      redirect_to  user_path(user), alert: 'フォローを解除できませんでした'
    end
  end

end
