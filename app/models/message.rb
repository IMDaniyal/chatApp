class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { broadcast_append_to self.room }
  before_create :confirm_participant
  after_create_commit :notify_recipient
  
  def notify_recipient
    recipient = notification_participant
    MessageNotification.with(message: self, user_id: self.user_id).deliver(recipient)
  end

  def notification_participant
    self.room.participants.where.not(user_id: self.user_id).first.user
  end

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end
