class Profile::Photographer::DashboardController < Profile::PhotographerController
  def index
    @photographer = current_user.decorate
  end
end
