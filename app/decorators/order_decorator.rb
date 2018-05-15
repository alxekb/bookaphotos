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

  def day
    session_day.start_time.strftime("%A, %d %b %Y")
  end

  def time
    session_day.start_time.strftime("%I:%M %p")
  end

  def client_email
    client.email
  end

  def client_phone
    client.phone
  end

  def client_full_name
    "#{client.first_name} #{client.last_name}"
  end

  def photo_session_title
    photo_session.title
  end

  def created_hour
    created_at.strftime("%H:%M")
  end

  def created_day
    created_at.strftime("%d %b %Y")
  end

  def session_day_lat
    session_day.location.lat
  end

  def session_day_lng
    session_day.location.lng
  end

  def session_day_location
    session_day.location
  end
end
