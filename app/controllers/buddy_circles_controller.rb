class BuddyCirclesController < ApplicationController
  def new
    @users = User.all.sort {|u1, u2| u1.email <=> u2.email}
    @users.delete(current_user)
    render :new
  end

  def create
    current_user.buddy_circle.delete
    current_user.buddy_circle = BuddyCircle.new
    current_user.buddy_circle.member_ids = params[:friends].values
    redirect_to buddy_circles_url
  end

  def index
    @circle = current_user.friendships.includes(:user)
    render :index
  end
end
