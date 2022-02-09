# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  
  param :message
  param :user_id

  # Define helper methods to make rendering easier.
  
  def message
    debugger
    t(".message")
  end
  
  def url
    user_path(params[:user_id])
  end
end
