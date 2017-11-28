class Order < ApplicationRecord
  belongs_to :user
  belongs_to :photo_session
end
