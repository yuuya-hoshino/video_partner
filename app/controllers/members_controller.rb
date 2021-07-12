class MembersController < ApplicationController
  include Pagy::Backend
  def index
    @follower_count = Relationship.group(:follower_id).count(:following_id)
    if params[:search]
      @pagy,@users = pagy(User.where('name like ? OR introduction like ?', "%#{params[:search]}%","%#{params[:search]}%" ))
    else
      @pagy,@users = pagy(User.where.not(id: current_user.id).order('id DESC'))
    end
  end
end
