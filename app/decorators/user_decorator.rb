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

  def connected_dropbox
    if profile.dropbox_token
      h.link_to "Dropbox - connected", h.photographer_dropbox_auth_path, class: "nav-link bg-light-green disabled"
    else
      h.link_to "Connect Dropbox", h.photographer_dropbox_auth_path, class: "nav-link"
    end
  end

  def to_s
    email
  end

  # Photographer  decorations

  def upcoming_events
    orders.joins(photo_session: :session_days)
          .where("session_days.start_time >= ?", Date.current).decorate
  end

  def upcoming_events_count
    orders.joins(photo_session: :session_days)
        .where("session_days.start_time >= ?", Date.current).count
  end

  def editing_orders
    orders.editing
  end

  def sorting_orders
    orders.sorting
  end

  def processing_orders
    orders.processing
  end

  def sent_orders
    orders.sent
  end

  def client_received_orders
    orders.client_received
  end

  def client_reviewed_orders
    orders.client_reviewed
  end

  def client_services_extended
    orders.client_service_extend
  end

  def closed_orders
    orders.order_closed
  end

  def archived_orders
    order.archived
  end

  # End Photographer decorations

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
