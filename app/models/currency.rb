class Currency < ApplicationRecord
  has_many :photo_sessions

  validates :title, presence: true

  def to_s
    title
  end
end
