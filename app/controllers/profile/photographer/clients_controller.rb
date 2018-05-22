class Profile::Photographer::ClientsController < Profile::PhotographerController
  def index
    @orders = @user.orders.group_by(&:client)
  end
end
