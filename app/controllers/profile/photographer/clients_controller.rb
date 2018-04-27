class Profile::Photographer::ClientsController < Profile::PhotographerController
  def index
    photo_sessions_ids = current_user.photo_sessions.map(&:id)
    @orders = Order.where(photo_session_id: photo_sessions_ids)
  end
end
