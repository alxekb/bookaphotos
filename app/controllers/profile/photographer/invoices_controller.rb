class Profile::Photographer::InvoicesController < Profile::PhotographerController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    result = current_user.photo_sessions.search(params)
    paginated = Kaminari.paginate_array(Order.where(photo_session_id: result.records.pluck(:id)))
    @invoices = PagesDecorator.decorate(paginated.page(params[:page]).per(20), with: OrderDecorator)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find_by(id: params[:id], user: current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.fetch(:invoice, {})
  end
end
