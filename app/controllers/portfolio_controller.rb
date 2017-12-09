class PortfolioController < ApplicationController
  def index
    @themes = Theme.all
    @photosessions = PhotoSession.all
    if params[:theme]
      @photosessions = @photosessions.includes(:themes).where(themes: { title: params[:theme] })
    end
    @photosessions = @photosessions.page(params[:page])
  end
end
