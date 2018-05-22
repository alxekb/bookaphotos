# frozen_string_literal: true

require "elasticsearch/model"

class SessionDay < ApplicationRecord
  attribute :session_time
  belongs_to :photo_session
  belongs_to :currency
  belongs_to :location
  has_many :orders

  after_commit { self.photo_session.__elasticsearch__.index_document }

  just_define_datetime_picker :start_time, add_to_attr_accessor: true

  validates :start_time,
            :price,
            :price_per_additional_photo,
            :additional_photos_limit,
            :photo_session_id,
            :currency_id,
            :location_id,
            presence: true
  validates :price,
            :price_per_additional_photo, numericality: { greater_than_or_equal_to: 1 }
  validate  :time_cannot_be_in_the_past

  def session_time
    self.start_time.strftime("%M%H").to_i * 100
  end

  private

  def time_cannot_be_in_the_past
    if start_time.present? && start_time < Date.current
      errors.add(:start_time, "can't be in the past")
    end
  end
end
