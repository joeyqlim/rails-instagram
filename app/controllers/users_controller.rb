class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @follow_list = current_user.followships.pluck(:following_id)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_bio)
      redirect_to user_path(current_user)
    else 
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_bio
    params.require(:user).permit(:biography)
  end
end
