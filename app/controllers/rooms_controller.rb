class RoomsController < ApplicationController
  before_action :set_users

  def index
    redirect_to '/signin' unless @current_user
  end

  def show
    @message = Message.new
    @single_room = Room.find(params[:id])
    @messages = @single_room.messages
    @room = Room.new

    render "index"
  end

  private

  def set_users
    @current_user = current_user
    @users = User.all_except(@current_user)
  end
end
