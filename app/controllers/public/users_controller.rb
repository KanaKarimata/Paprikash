class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @schedule_new = Schedule.new

    if Schedule.exists?
      @schedule = Schedule.find(params[:id])
    end

  end

  def index
  end

  def edit
  end
end
