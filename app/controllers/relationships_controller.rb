class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follower_id])
    current_user.follow!(@user)
    redirect_to user_path(params[:follower_id])
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to user_path(params[:id])
  end

  private

  def create_params
    params.permit(:following_id)
  end
end
