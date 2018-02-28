class OrdersController < ApplicationController
  def create
    # render plain: orders_params.inspect
    @order = Order.new(orders_params)
    @order.user = User.first
    @order.save
  end

  private

  def orders_params
    params.require(:order).permit(:name, :email, :phone, :comment, :photo_session_id, :session_day_id, :photo_count)
  end
end
