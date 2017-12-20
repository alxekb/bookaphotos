class Order < ApplicationRecord
  belongs_to :user
  belongs_to :photo_session
  belongs_to :session_day
end
