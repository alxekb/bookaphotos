class Location < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :session_days

  accepts_nested_attributes_for :session_days

  validates :name,
            :address,
            :how_to_find,
            :lat,
            :lng,
            :user_id,
            :city_id,
            presence: true
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
