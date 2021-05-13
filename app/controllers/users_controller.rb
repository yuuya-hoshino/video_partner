class UsersController < ApplicationController
  def index
    @users = User.all.order('id DESC').limit(5)
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    if @user.save
      redirect_to(user_path(current_user.id))
    else
      render(edit_user_path(@user.id))
    end
  end

  def logout
    redirect_to("/")
  end

end
