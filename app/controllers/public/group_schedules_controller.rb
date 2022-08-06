class Public::GroupSchedulesController < ApplicationController

  def create
    @group_schedule = GroupSchedule.new(schedule_params)
    @group_schedule.group_id = group.id
    if @group_schedule.save!
      redirect_to request.referer
    else
      flash[:notice] = "保存できませんでした。"
      redirect_to request.referer
    end
  end

  private

  def schedule_params
    params.require(:group_schedule).permit(:group_id, :title, :content, :start, :finish)
  end

end
