class Profile::PhotographerController < ProfileController
  before_action :require_permission
  before_action :set_photographer

  private

  def set_photographer
    @photographer = current_user.decorate
  end

  def require_permission
    redirect_to root_path unless current_user.photographer?
  end
end
