class Profile::Photographer::TasksController < Profile::PhotographerController
  include OrderStateActions
  def index
    @user = current_user.decorate
  end
end
