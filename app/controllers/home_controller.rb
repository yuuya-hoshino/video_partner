class HomeController < ApplicationController
  def top
    if user_signed_in?
      @users = User.where.not(id: current_user.id).order('id DESC').limit(5)
    else
      @users = User.all.order('id DESC').limit(5)
    end
  end
end
