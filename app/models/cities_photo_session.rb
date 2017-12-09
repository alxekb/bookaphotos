class CitiesPhotoSession < ApplicationRecord
  belongs_to :city
  belongs_to :photo_session
end
