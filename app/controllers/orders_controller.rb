class OrdersController < ApplicationController
  def create
    @order = Order.new(orders_params)
    @order.user = User.first
    @order.save
  end

  private

  def orders_params
    params.require(:order).permit(:name, :email, :phone, :comment, :photo_session_id, :session_date_id, :photo_count)
  end
end
