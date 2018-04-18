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
end
