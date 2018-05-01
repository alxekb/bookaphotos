class Profile::Client::DashboardController < ProfileController
  def index
    @user = current_user.decorate
  end
end
