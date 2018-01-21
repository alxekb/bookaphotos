class Invoice < ApplicationRecord
  STATUS = %w(InProgress Paid Declined).freeze

  belongs_to :photo_session
  belongs_to :user
end
