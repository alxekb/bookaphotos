class Cover < ApplicationRecord
  belongs_to :photo_session

  has_attached_file :photo,
                    styles: { medium: "300x300#", thumb: "100x100#" },
                    default_url: "/images/:style/missing.png",
                    path: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
