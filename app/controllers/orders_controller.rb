class OrdersController < ApplicationController
  def create
    # render plain: orders_params.inspect
    @order = Order.new(orders_params)
    if current_user
      @order.user = current_user
    else
      @order.user = User.first
    end
    @order.save
  end

  private

  def orders_params
    params.require(:order).permit(:name, :email, :phone, :comment, :photo_session_id, :session_day_id, :photo_count, :i_want_to_get_info, :i_accept_term, :i_consent_personal_data)
  end
end
