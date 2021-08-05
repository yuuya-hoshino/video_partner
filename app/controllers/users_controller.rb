class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order('id DESC').limit(5)
    follower = Relationship.where(follower_id: current_user.id).pluck('following_id')
    following = Relationship.where(following_id: current_user.id).pluck('follower_id')
    @matching_users = User.where(id: follower & following).limit(5)
    @users_liked_to_me = User.where(id: follower).limit(5)
    @users_liked_from_me = User.where(id: following).limit(5)
    @follower_count = Relationship.group(:follower_id).count(:following_id)
  end

  def show
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.new
    @follower_count = Relationship.where(follower_id: @user.id).count
    # @role = Role.find_by(role_id: params[:id])
    # @genre = Genre.find_by(genre_id: params[:id])
    # @subgenre = Subgenre.find_by(subgenre_id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user == current_user
      render "edit"
    else
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
    # params.permit(:name, :introduction,:image_name,:genre_id)
    params.require(:user).permit(:name, :introduction,:image_name,:genre_id,:role_id,:subgenre_id)
  end

  def logout
    redirect_to("/")
  end
end
