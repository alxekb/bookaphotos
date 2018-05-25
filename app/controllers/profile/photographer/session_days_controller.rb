class Profile::Photographer::SessionDaysController < Profile::PhotographerController
  before_action :set_session_day, only: %i[show]

  respond_to :html, :js, :json

  def index
    @photo_sessions = current_user.photo_sessions.decorate
    @session_days = SessionDay.by_photo_session(params[:q], current_user).page(params[:page]).per(2)
  end

  def show
    @orders = @session_day.orders.decorate
  end

  def new
    @session_day = SessionDay.new.decorate
  end

  def create
    @session_day = SessionDay.new(session_day_params).decorate
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
    @session_day = SessionDay.find(params[:id]).decorate
  end

  def session_day_params
    params.require(:session_day)
          .permit(
            :photo_session_id,
            :start_time,
            :price,
            :currency_id,
            :price_per_additional_photo,
            :additional_photos_limit,
            :location_id
          )
  end
end
