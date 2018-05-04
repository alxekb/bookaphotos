class Profile::Photographer::ClientsController < Profile::PhotographerController
  def index
    @orders = @user.orders.decorate
  end
end
