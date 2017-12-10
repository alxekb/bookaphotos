class PhotosessionsController < ApplicationController
  def index
    @photosessions = PhotoSession.all.page(params[:page])
  end
end
