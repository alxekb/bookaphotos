class UserDecorator < Draper::Decorator
  delegate_all

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

  def dropbox_status
    if profile.dropbox_token
      h.content_tag :span, "Connected", class: "badge badge-success"
    else
      h.content_tag(:span, "Not Connected", class: "badge badge-secondary")
    end
  end

  def connected_dropbox
    if profile.dropbox_token
      h.link_to "Disconnect", h.photographer_dropbox_disconnect_path, class: "btn btn-danger"
    else
      h.link_to "Connect", h.photographer_dropbox_auth_path, class: "btn btn-success"
    end
  end

  def to_s
    email
  end

  # Photographer  decorations

  def session_days
    SessionDay.where(photo_session_id: object.photo_session_ids).decorate
  end

  def upcoming_events
    orders.where(aasm_state: [:created, :paid]).joins(photo_session: :session_days)
          .where("session_days.start_time >= ?", Date.current).decorate
  end

  def upcoming_events_price
    upcoming_events.sum(&:total_amount)
  end

  def upcoming_events_count
    orders.where(aasm_state: [:created, :paid]).joins(photo_session: :session_days)
        .where("session_days.start_time >= ?", Date.current).count
  end

  def sorting_photos_count
    orders_by_state(:sorting).count
  end

  def sorting_photos_price
    sorting_orders.sum(&:total_amount)
  end

  def editing_photos_count
    orders_by_state(:editing).count
  end

  def editing_photos_price
    editing_orders.sum(&:total_amount)
  end

  def sent_photos_count
    orders_by_state(:sent).count
  end

  def sent_photos_price
    sent_orders.sum(&:total_amount)
  end

  def closed_orders_count
    orders_by_state(:order_closed).count
  end

  def closed_orders_price
    closed_orders.sum(&:total_amount)
  end

  def editing_orders
    orders_by_state [:editing, :edited]
  end

  def sorting_orders
    orders_by_state [:sorting, :sorted]
  end

  def processing_orders
    orders_by_state [:processing, :processed]
  end

  def sent_orders
    orders_by_state :sent
  end

  def client_received_orders
    orders_by_state :client_received
  end

  def client_reviewed_orders
    orders_by_state :client_reviewed
  end

  def client_services_extended
    orders_by_state :client_service_extend
  end

  def closed_orders
    orders_by_state :order_closed
  end

  def archived_orders
    orders_by_state :archived
  end

  # Drying up states method
  def orders_by_state(states)
    orders.where(aasm_state: states).joins(photo_session: :session_days).distinct.decorate
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
