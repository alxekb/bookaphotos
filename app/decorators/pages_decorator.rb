class PagesDecorator < Draper::CollectionDecorator
  delegate :current_page, :per_page, :offset, :total_entries, :total_pages, :limit_value
end
