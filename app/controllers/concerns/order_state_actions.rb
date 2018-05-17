module OrderStateActions
  extend ActiveSupport::Concern

  def start_editing
    @order.start_editing!
  end

  def finish_editing
    @order.finish_editing!
  end

  def start_sorting
    @order.start_sorting!
  end

  def finish_sorting
    @order.finish_sorting!
  end

  def send_photos
    @order.sending!
  end

  def client_receive
    @order.client_receiving!
  end

  def client_review
    @order.client_reviewing!
  end

  def client_add_service
    @order.client_extend_service!
  end

  def closing_order
    @order.close_order!
  end

  def archiving_order
    @order.archive_order!
  end
end
