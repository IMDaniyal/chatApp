class MessagesController < ApplicationController
    before_action :get_current_user
    def create
        @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    end
    
    private
    def get_current_user
        @current_user = current_user
    end

    def msg_params
        params.require(:message).permit(:content)
    end
end
