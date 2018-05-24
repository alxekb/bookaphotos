class Profile < ApplicationRecord
  belongs_to :user
  delegate :email,
           :role,
           :photographer?,
           :client?,
           to: :user
  attr_accessor :remove_avatar

  before_save :delete_avatar, if: -> { remove_avatar == "1" && !avatar_updated_at_changed? }

  validates :user, presence: true
  validates :first_name, :last_name, :phone, presence: true

  has_attached_file :avatar, styles: { medium: "64x64#", thumb: "16x16#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  private

  def delete_avatar
    self.avatar = nil
  end
end
