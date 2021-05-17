class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order('id DESC').limit(5)
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
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
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    @user.image_name = params[:image_name]
    if @user.save
      redirect_to(user_path(current_user.id))
    else
      render("users/edit")
    end
  end

  def logout
    redirect_to("/")
  end

end
class User < ApplicationRecord
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

#友達判定
  def matchers
    followings & followers
  end
end