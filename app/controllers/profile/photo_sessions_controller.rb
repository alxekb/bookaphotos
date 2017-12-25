class Profile::PhotoSessionsController < ApplicationController
  before_action :set_photo_session, only: [:show, :edit, :update, :destroy]

  # GET /photo_sessions
  # GET /photo_sessions.json
  def index
    @photo_sessions = current_user.photo_sessions
  end

  # GET /photo_sessions/1
  # GET /photo_sessions/1.json
  def show
  end

  # GET /photo_sessions/new
  def new
    @photo_session = PhotoSession.new
  end

  # GET /photo_sessions/1/edit
  def edit
  end

  # POST /photo_sessions
  # POST /photo_sessions.json
  def create
    @photo_session = PhotoSession.new(photo_session_params)
    @photo_session.user = current_user

    respond_to do |format|
      if @photo_session.save
        format.html { redirect_to [:profile, @photo_session], notice: 'Photo session was successfully created.' }
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
        format.html { redirect_to [:profile, @photo_session], notice: 'Photo session was successfully updated.' }
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
      format.html { redirect_to profile_photo_sessions_url, notice: 'Photo session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_session
      @photo_session = PhotoSession.find_by(id: params[:id], user: current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_session_params
      params.fetch(:photo_session, {}).permit(:title, :description, :price)
    end
end
