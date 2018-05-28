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

  def photo_session_title
    photo_session.title
  end

  def location_name
    location.name
  end

  def location_address
    location.address
  end

  def location_find
    location.how_to_find
  end

  def location_city
    location.city.title
  end

  def location_latitude
    location.lat
  end

  def location_longitude
    location.lng
  end

  def currency_name
    currency.title
  end

  def booked_appointments
    Order.where("session_day_id = ?", object.id).count
  end

  def session_day_params(params)
    if params[:day]
      @day = params[:day].to_datetime
    else
      @day = DateTime.current.to_datetime
    end
  end

  def status
    if object.start_time.to_date < Date.today
      h.content_tag(:td, "Ended", class: "bg-light-brown")
    elsif object.start_time > Date.current && (Date.current.to_date - object.start_time.to_date).to_i < 30
      h.content_tag(:td, "Open", class: "bg-light-green")
    elsif object.start_time == Date.current
      h.content_tag(:td, "In process", class: "bg-light-blue")
    else
      h.content_tag(:td, "Archived", class: "bg-secondary")
    end
  end

  def user_photo_sessions
    current_user.photo_sessions
  end

  def user_locations
    current_user.locations
  end
end
