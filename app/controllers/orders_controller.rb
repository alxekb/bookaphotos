class OrdersController < ApplicationController
  def create
    @order = Order.new(orders_params)
    unless user_signed_in?
      @order.client = new_client
    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Your order have been saved!' }
      else
        format.html { redirect_to photo_session_order_path(@order.photo_session, @order.session_day.id), alert: 'Errors' }
      end
    end
  end

  private

  def orders_params
    params
        .require(:order)
        .permit(
          :comment,
          :photo_session_id,
          :session_day_id,
          :photo_count,
          :i_want_to_get_info,
          :i_accept_term,
          :i_consent_personal_data,
          :retouch,
          :photographer_id,
          :client_id,
        )
  end

  #TODO move logic to a background worker

  def new_client
    user_params = params[:user]
    new_client = User.new
    new_client.role = "client"
    new_client.email = user_params[:email]
    temp_password = Devise.friendly_token.first(8)
    new_client.password = temp_password
    new_client.save
    new_client
  end

  def new_client_profile
    client_profile = new_client.build_profile
    client_profile.first_name = user_params[:first_name]
    client_profile.last_name = user_params[:last_name]
    client_profile.phone = user_params[:phone]
    client_profile.save
  end
end
