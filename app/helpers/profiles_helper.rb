module ProfilesHelper
  # Default google map point: London
  def default_latitude(location)
    if location.lat.nil? || location.lat == ""
      51.509865
    else
      location.lat
    end
  end

  def default_longitude(location)
    if location.lng.nil? || location.lng == ""
      -0.118092
    else
      location.lng
    end
  end

  def update_state_link(object)
    next_state = object.aasm.events.map(&:name).first
    next_state = next_state.to_s == "sending" ? :send_photos : next_state
    link_to next_state.to_s.humanize, send("#{next_state.to_s}_photographer_tasks_path",
                   order_id: object.id),
              remote: true,
              method: :patch, class: "btn btn-success"
  end
end
