class Profile::ClientController < ProfileController
  before_action :require_permission

  private

  def require_permission
    redirect_to root_path unless current_user.client?
  end
end
