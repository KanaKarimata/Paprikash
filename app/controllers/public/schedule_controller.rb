class Public::ScheduleController < ApplicationController
  def index
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to request.referer
    else
      flash[:notice] = "保存できませんでした。"
      redirect_to request.referer
    end
  end

  def update
  end

  def destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :title, :content)
  end

end
