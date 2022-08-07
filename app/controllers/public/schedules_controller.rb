class Public::SchedulesController < ApplicationController
  def index
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save!
      redirect_to request.referer
    else
      flash[:notice] = "保存できませんでした。"
      redirect_to request.referer
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to request.referer
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to  request.referer
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :title, :content, :start, :finish)
  end

end
