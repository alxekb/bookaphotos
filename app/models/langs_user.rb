class LangsUser < ApplicationRecord
  belongs_to :lang
  belongs_to :user

  validates :lang_id, :user_id, presence: true
end
