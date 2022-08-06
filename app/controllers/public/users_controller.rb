class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @schedule_new = Schedule.new

    if Schedule.exists?
      @schedule = Schedule.find(params[:id])
      @schedules = @user.schedules
    end

  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
