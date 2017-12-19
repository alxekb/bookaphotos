require 'elasticsearch/model'

class SessionDay < ApplicationRecord
  belongs_to :photo_session

  after_commit { self.photo_session.__elasticsearch__.index_document }

  just_define_datetime_picker :when, :add_to_attr_accessor => true
  validates :when, :presence => true
end
