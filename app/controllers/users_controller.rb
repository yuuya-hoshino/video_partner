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
