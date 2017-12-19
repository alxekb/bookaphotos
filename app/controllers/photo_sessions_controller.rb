class PhotoSessionsController < ApplicationController
  def index
    @photosessions = PhotoSession.search(params).page(params[:page])
  end

  def show
    @photosession = PhotoSession.find params[:id]
  end
end
