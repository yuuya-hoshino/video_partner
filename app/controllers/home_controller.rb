class HomeController < ApplicationController
  def top
    @users = User.all.order('id DESC').limit(5)
  end
end
