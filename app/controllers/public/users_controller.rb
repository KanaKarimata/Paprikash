class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @schedule_new = Schedule.new
    @schedules = @user.schedules
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

  def withdraw
    @user = current_user
    if @user.email == 'guest@example.com'
      reset_session
      redirect_to root_path
    else
      @user.update(is_deleted: true)
      #ここでis_deletedカラムの値を"退会"に更新
       reset_session
       redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
