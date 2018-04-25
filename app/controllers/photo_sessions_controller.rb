class PhotoSessionsController < ApplicationController
  def index
    @photosessions = PhotoSession.search(params).page(params[:page])
  end

  def show
    @photosession = PhotoSession.find params[:id]
    @photosessions = PhotoSession.all
  end

  def order
    @photosession = PhotoSession.find params[:photo_session_id]
    @date = SessionDay.find params[:session_date_id]
    @order = Order.new
  end
end
