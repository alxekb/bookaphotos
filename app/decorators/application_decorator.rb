class ApplicationDecorator < Draper::Decorator
  def current_user
    context[:user] || h.current_user
  end

  def self.collection_decorator_class
    PagesDecorator
  end
end
