class LangsUser < ApplicationRecord
  belongs_to :lang
  belongs_to :user
end
