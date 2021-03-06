class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order('id DESC').limit(15)
    follower = Relationship.where(follower_id: current_user.id).pluck('following_id')
    following = Relationship.where(following_id: current_user.id).pluck('follower_id')
    @matching_users = User.where(id: follower & following).limit(15)
    @users_liked_to_me = User.where(id: follower).limit(15)
    @users_liked_from_me = User.where(id: following).limit(15)
    @follower_count = Relationship.group(:follower_id).count(:following_id)
  end

  def show
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.new
    @follower_count = Relationship.where(follower_id: @user.id).count
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user != current_user
      redirect_to users_path
    end

  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to(user_path(current_user.id))
    else
      render("users/edit")
    end
  end

  private
  def user_params
    params.require(:user).permit(:genre_id, :role_id, :subgenre_id, :name, :introduction, :image_name, :money)
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end
end
