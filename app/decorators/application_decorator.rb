class ApplicationDecorator < Draper::Decorator
  def current_user
    context[:user] || h.current_user
  end
end
