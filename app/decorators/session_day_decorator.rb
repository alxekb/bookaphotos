class SessionDayDecorator < ApplicationDecorator
  delegate_all

  decorates_association :photo_session
  decorates_association :order

  def day
    start_time.strftime("%d-%m-%Y")
  end

  def hour
    start_time.strftime("%H:%M")
  end
end
