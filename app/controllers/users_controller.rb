class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @commented_restaurants = @user.commented_restaurants
    @favorited_restaurants = @user.favorited_restaurants
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :intro, :avatar)
  end

end
