class SessionDay < ApplicationRecord
  belongs_to :photo_session

  just_define_datetime_picker :when, :add_to_attr_accessor => true
  validates :when, :presence => true
end
