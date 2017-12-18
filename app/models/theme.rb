class Theme < ApplicationRecord
  has_and_belongs_to_many :photo_sessions
  after_update { self.photo_sessions.each(&:touch) }
end
