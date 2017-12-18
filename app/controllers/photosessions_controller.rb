class PhotosessionsController < ApplicationController
  def index
    @photosessions = PhotoSession.search(params).page(params[:page])
  end
end
