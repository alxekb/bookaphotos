class Order::SelectedOption < ApplicationRecord
  self.table_name = "order_selected_options"

  belongs_to :option, class_name: "PhotoSession::Option", foreign_key: "photo_session_additional_option_id"
  belongs_to :order
end
