class Public::UsersController < ApplicationController
  def show
    @schedule_new = Schedule.new 
    @schedule = Schedule.find(params[:id])
    
  end

  def index
  end

  def edit
  end
end
