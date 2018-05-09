class ChargesController < ApplicationController
  before_action :set_amount
  def new
    #@total_amount = @order.total_amount * 100
  end

  def create
    @amount = @total_amount

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails stripe customer',
      currency: 'usd'
    )
    @order.pay!
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def set_amount
    @order ||= Order.find(params[:order_id])
    @total_amount ||= @order.total_amount * 100
  end
end
