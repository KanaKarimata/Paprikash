class Public::ScheduleController < ApplicationController
  def index
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def schedule_params
    paramas.require(:schedule).permit(:)
  end
  
end
