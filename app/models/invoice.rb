class Invoice < ApplicationRecord
  belongs_to :photosession
  belongs_to :user
end
