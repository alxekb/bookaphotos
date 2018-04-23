class Profile < ApplicationRecord
  belongs_to :user
  delegate :name,
           :email,
           :role,
           :avatar,
           :phone,
           :photographer?,
           :client?,
           to: :user
  validates :user, presence: true
  # TODO migrate profile related data from user such as: role, avatar, phone, name, etc.
end
