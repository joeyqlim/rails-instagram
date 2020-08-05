class FollowshipsController < ApplicationController
  def create
    @followship = current_user.followships.build(:following_id => params[:following_id])
    if @followship.save
      flash[:notice] = "Followed!"
      redirect_to users_path
    else
      flash[:alert] = "Unable to follow user"
      redirect_to users_path
    end
  end

  def destroy
    @followship = current_user.followships.find(params[:id])
    @followship.destroy
    flash[:notice] = "Unfollowed!"
    redirect_to user_path(current_user)
  end
end
