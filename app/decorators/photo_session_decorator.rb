class PhotoSessionDecorator < ApplicationDecorator
  delegate_all

  decorates_association :orders
  def photographer
    user
  end

  def photographer_phone
    photographer.phone
  end

  def photographer_email
    photographer.email
  end

  def cover
    covers.first.photo.url(:medium)
  end
end
