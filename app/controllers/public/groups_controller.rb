class Public::GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @group_member = @group.users
    @owner = @group.owner
    @group_schedule_new = GroupSchedule.new
    @group_schedules = @group.group_schedules
    @chat = Chat.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    redirect_to groups_path
  end

  def update
    @group.update(group_params)
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

end
