class Profile::Client::DashboardController < ProfileController
  def index
    @user = current_user
    @orders = current_user.orders
  end

  def create
    user = current_user
    user.phone = params[:user][:phone]
    user.name = params[:user][:name]
    user.save

    redirect_to client_path, notice: 'Setting was updated'
  end
end