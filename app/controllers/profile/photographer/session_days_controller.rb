class Profile::Photographer::SessionDaysController < Profile::PhotographerController
  before_action :set_session_day, only: %i[show new]

  def index
    @session_days = current_user.photo_sessions.joins(:session_days)
  end

  def show; end

  def new
    @session_day = SessionDay.new
  end

  def create
    @session_day = SessionDay.new(session_day_params)
    respond_to do |format|
      if @session_day.save
        format.html { redirect_to [:photographer, @session_day], notice: "Session Day was successfully created." }
        format.json { render :show, status: :created, location: @session_day }
      else
        format.html { render :new }
        format.json { render json: @session_day.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_session_day
    @session_day = SessionDay.find(params[:id])
  end

  def session_day_params
    params.require(:session_day)
          .permit(
            :session_day_id,
            :start_time,
            :currency_id,
            :price_per_additional_photo,
            :additional_photos_limit,
            :location_id
          )
  end
end
