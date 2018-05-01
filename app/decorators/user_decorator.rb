class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :photo_session
  decorates_association :user

  def photographer
    if current_user.photograph?
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

  def upcoming_photosessions
    orders.joins(photo_session: :session_days)
        .where("session_days.start_time >= ?", Date.current)
  end

  def finished_photosessions
    orders.joins(photo_session: :session_days)
        .where("session_days.start_time <= ?", Date.current)
  end
end
