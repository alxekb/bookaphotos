class PhotoSessionsTheme < ApplicationRecord
  belongs_to :photo_session
  belongs_to :theme

  validates :photo_session_id, :theme_id, presence: true
end
