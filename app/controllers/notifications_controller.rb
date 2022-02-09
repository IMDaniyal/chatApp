class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.unread.uniq { |n| n.params[:user_id] }
  end

  def mark_read
    notifications = current_user.notifications.unread.find_all {|n| n.params[:user_id] == params[:id].to_i  }
    return if notifications.empty?

    notifications.each do |n|
      n.mark_as_read!
    end
    message = Room.find(params[:room_id]).messages.last
    redirect_to user_path(notifications.first.params[:message].user.id, anchor: "#message_#{message.id}")
  end
end
