class Public::ScheduleController < ApplicationController
  def index
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to request.referer
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def schedule_params
    paramas.require(:schedule).permit(:user_id, :group_id, :title, :content, :start, :finish)
  end
  
end
