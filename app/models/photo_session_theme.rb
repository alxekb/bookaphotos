class PhotoSessionTheme < ApplicationRecord
  belongs_to :photo_session
  belongs_to :theme
end
