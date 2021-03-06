class Profile::Client::PhotoSessionsController < Profile::ClientController
  def index
    @orders = @user.bookings.decorate
  end

  def show
    @order = Order.find(params[:id]).decorate
    @photo_session = @order.photo_session.decorate
  end
end
