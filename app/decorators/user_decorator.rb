class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :photo_sessions

  def photographer
    if current_user.photographer?
      current_user
    else
      nil
    end
  end

  def client
    if current_user.client?
      current_user
    else
      nil
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    email
  end

  def upcoming_events_count
    orders.joins(photo_session: :session_days)
        .where("session_days.start_time >= ?", Date.current).count
  end

  # client photo sessions
  def upcoming_photosessions
    bookings.joins(photo_session: :session_days)
        .where("session_days.start_time >= ?", Date.current).decorate
  end

  # client photo sessions
  def finished_photosessions
    bookings.joins(photo_session: :session_days)
        .where("session_days.start_time <= ?", Date.current)
  end
end
