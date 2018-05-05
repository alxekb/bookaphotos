class Profile::Photographer::TasksController < ProfileController
  include OrderStateActions
  before_action :set_order

  def index
    @user = current_user.decorate
  end
end
