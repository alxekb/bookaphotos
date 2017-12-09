class PhotoSession < ApplicationRecord
  belongs_to :user

  scope :published, -> { where(published: true) }

  has_and_belongs_to_many :cities
  has_and_belongs_to_many :themes
end
