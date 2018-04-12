class Profile::ProfileController < ApplicationController
  layout 'photographer'

  def show
  end

  def tasks
  end

  def shooting_days
  end

  def clients
    photo_sessions_ids = current_user.photo_sessions.map(&:id)
    @orders = Order.where(photo_session_id: photo_sessions_ids)
  end
end
