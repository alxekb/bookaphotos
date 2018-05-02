class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :photo_session
  decorates_association :session_day
  decorates_association :client

  def photo_session_day
    session_day.day
  end

  def photo_session_hour
    session_day.hour
  end

  def day
    session_day.start_time.strftime("%A, %d %b %Y")
  end

  def time
    session_day.start_time.strftime("%I:%M %p")
  end
end
