class PhotoSessionDecorator < ApplicationDecorator
  delegate_all

  decorates_association :orders
  decorates_association :client
  #decorates_association :session_days

  def photographer
    user
  end

  def photographer_full_name
    "#{user.first_name}" "#{user.last_name}"
  end

  def photographer_phone
    photographer.phone
  end

  def photographer_email
    photographer.email
  end

  def photographer_avatar
    photographer.avatar.url(:medium)
  end

  def cover
    covers.first.photo.url(:thumb)
  end

  def full_cover
    covers.first.photo.url(:original)
  end

  def location
    user.location.name
  end

  def active_session_days_count
    session_days.where("start_time >= ?", Date.current).count
  end
end
