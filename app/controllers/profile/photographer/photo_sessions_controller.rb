class Profile::Photographer::PhotoSessionsController < Profile::PhotographerController
  before_action :set_photo_session, only: [:show, :edit, :update, :destroy]

  # GET /photo_sessions
  # GET /photo_sessions.json
  def index
    @photo_sessions = current_user.photo_sessions.decorate
  end

  # GET /photo_sessions/1
  # GET /photo_sessions/1.json
  def show
  end

  # GET /photo_sessions/new
  def new
    @photo_session = current_user.photo_sessions.new
    @photo_session.covers.build
    @photo_session.photos.build
  end

  # GET /photo_sessions/1/edit
  def edit
  end

  # POST /photo_sessions
  # POST /photo_sessions.json
  def create
    @photo_session = current_user.photo_sessions.new(photo_session_params)
    respond_to do |format|
      if @photo_session.save
        format.html { redirect_to [:photographer, @photo_session], notice: "Photo session was successfully created." }
        format.json { render :show, status: :created, location: @photo_session }
      else
        format.html { render :new }
        format.json { render json: @photo_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_sessions/1
  # PATCH/PUT /photo_sessions/1.json
  def update
    respond_to do |format|
      if @photo_session.update(photo_session_params)
        format.html { redirect_to [:photographer, @photo_session], notice: "Photo session was successfully updated." }
        format.json { render :show, status: :ok, location: @photo_session }
      else
        format.html { render :edit }
        format.json { render json: @photo_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_sessions/1
  # DELETE /photo_sessions/1.json
  def destroy
    @photo_session.destroy
    respond_to do |format|
      format.html { redirect_to profile_photo_sessions_url, notice: "Photo session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo_session
    @photo_session = PhotoSession.find_by(id: params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_session_params
    params.require(:photo_session)
          .permit(
            :user_id,
            :title,
            :description,
            :published,
            :duration,
            :photos_count,
            :period_of_execution,
            :currency_id,
            :for_whom,
            :preparation,
            :what_to_take,
            :session_type,
            covers_attributes: [:photo],
            photos_attributes: [:photo]
          )
  end
end
