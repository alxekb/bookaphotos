class PhotoSession::Option < ApplicationRecord
  self.table_name = "photo_session_additional_options"

  belongs_to :photo_session
  belongs_to :additional_option

  has_many :selected_options, class_name: "Order::SelectedOption", foreign_key: :photo_session_additional_option_id
  accepts_nested_attributes_for :selected_options

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 1 },
            allow_nil: false,
            allow_blank: false
  validates :additional_option_id, presence: true, uniqueness: { scope: :photo_session_id, message: "must be uniq" }

  def option_with_price
    "#{additional_option.name} $#{price}"
  end
end
