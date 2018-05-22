class Order < ApplicationRecord
  include OrderStateMachine

  belongs_to :client, class_name: "User"
  belongs_to :photographer, class_name: "User"
  belongs_to :photo_session
  belongs_to :session_day

  has_many :selected_options, class_name: "Order::SelectedOption", foreign_key: :order_id
  accepts_nested_attributes_for :selected_options


  validates :client_id,
            :photographer_id,
            :photo_session_id,
            :session_day_id,
            :aasm_state,
            presence: true
  validates :comment, presence: true, allow_nil: true, allow_blank: true
  validates :photo_count,
            numericality: { greater_than_or_equal_to: 1 },
            allow_blank: true,
            allow_nil: true
  validates :i_accept_term,
            :i_consent_personal_data,
            inclusion: { in: [true] }
  validates :i_want_to_get_info, inclusion: { in: [true, false] }
  validate :ensure_user_agreement
  # currently there is no option for additional photos (disabled)
  #validate :order_additional_photos_limit

  private

  def ensure_user_agreement
    if !self.i_consent_personal_data && !self.i_accept_term
      errors.add(:i_consent_personal_data, "You must agree to continue.")
      errors.add(:i_accept_term, "You must accept term's to continue")
    elsif !self.i_consent_personal_data
      errors.add(:i_consent_personal_data, "You must agree to continue.")
    elsif !self.i_accept_term
      errors.add(:i_accept_term, "You must accept term's to continue")
    end
  end

  def order_additional_photos_limit
    if session_day
      if self.photo_count > self.session_day.additional_photos_limit
        errors.add(:photo_count, "Can't be more than specified by photographer.")
      end
    end
  end
end
