class Profile::Photographer::ClientsController < Profile::PhotographerController
  def index
    kam = Kaminari.paginate_array(@user.orders.to_a.uniq(&:client))
    @paginated = PagesDecorator.decorate(kam.page(params[:page]).per(20), with: OrderDecorator)
    @orders = @paginated
  end
end
