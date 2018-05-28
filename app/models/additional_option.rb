class AdditionalOption < ApplicationRecord
  belongs_to :user

  has_many :photo_session_options, class_name: "PhotoSession::AdditionalOption", foreign_key: :additional_option_id
  accepts_nested_attributes_for :photo_session_options

  validates :name, presence: true, allow_blank: false, allow_nil: false
end
