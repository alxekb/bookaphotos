class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :photo_session
  decorates_association :session_day

  def photo_session_day
    session_day.day
  end

  def photo_session_hour
    session_day.hour
  end
end
