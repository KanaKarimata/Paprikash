class Public::GroupSchedulesController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    @group_schedule = GroupSchedule.new(group_schedule_params)
    @group_schedule.group_id = group.id
    if @group_schedule.save!
      redirect_to request.referer
    else
      flash[:notice] = "保存できませんでした。"
      redirect_to request.referer
    end
  end

  def update
    @group_schedule = GroupSchedule.find(params[:id])
    @group_schedule.update(group_schedule_params)
    redirect_to request.referer
  end

  def destroy
    @group_schedule = GroupSchedule.find(params[:id])
    @group_schedule.destroy
    redirect_to request.referer
  end

  private

  def group_schedule_params
    params.require(:group_schedule).permit(:group_id, :title, :content, :start, :finish)
  end

end
