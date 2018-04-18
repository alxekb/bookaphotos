class Profile::Photographer::SessionDaysController < Profile::PhotographerController
  before_action :set_shooting_day, only: %i[show new edit update]

  def index
    @photo_sessions = current_user.photo_sessions
  end

  private

  def set_shooting_day
    @shooting_day = SessionDay.find(params[:id])
  end
end