class Profile < ApplicationRecord
  belongs_to :user
  delegate :email,
           :role,
           :photographer?,
           :client?,
           to: :user
  validates :user, presence: true
  validates :first_name, :last_name, :phone, presence: true

  has_attached_file :avatar, styles: { medium: "64x64#", thumb: "16x16#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
