class Profile::Photographer::TasksController < Profile::PhotographerController
  include OrderStateActions
  respond_to :html, :js, :json
  before_action :set_order, except: :index

  def index
    if params[:order_id]
      @order = Order.find(params[:order_id]).decorate
    end
    @user = current_user.decorate
  end

  private

  def set_order
    @order = Order.find(params[:order_id]).decorate
  end
end
