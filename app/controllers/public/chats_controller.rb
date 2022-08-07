class Public::ChatsController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    chat = current_user.chats.new(chat_params)
    chat.group = group
    chat.user_id = current_user.id
    if chat.save!
      redirect_to group_path(group)
    elsif
      flash[:notice] = "送信できませんでした"
      redirect_to group_path(group)
    end
  end

  def chat_params
    params.require(:chat).permit(:message, :user_id, :group_id)
  end

end
