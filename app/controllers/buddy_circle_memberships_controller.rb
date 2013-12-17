class BuddyCircleMembershipsController < ApplicationController
  def destroy
    @membership = BuddyCircleMembership.find(params[:id])
    @membership.delete
    redirect_to buddy_circles_url
  end
end
