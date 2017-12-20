class Photo < ApplicationRecord
  belongs_to :photo_session

  has_attached_file :photo, styles: { medium: "980x520#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
