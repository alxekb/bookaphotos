class Currency < ApplicationRecord
  has_many :photo_sessions

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false }

  def to_s
    title
  end
end
