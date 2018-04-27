class CitiesPhotoSession < ApplicationRecord
  belongs_to :city
  belongs_to :photo_session

  validates :city_id, :photo_session_id, presence: true
end
