class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end

  def unsubscribed
    ActionCable.server.broadcast "activity_channel", user_id: current_user.id, status: 'offline'
    current_user.online = false
  	current_user.save!
  end

  def appear
  	ActionCable.server.broadcast "activity_channel", user_id: current_user.id, status: 'online'
  	current_user.online = true
  	current_user.save!
  end

end
