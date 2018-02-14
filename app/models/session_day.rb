require 'elasticsearch/model'

class SessionDay < ApplicationRecord
  attribute :session_time
  belongs_to :photo_session
  belongs_to :currency

  after_commit { self.photo_session.__elasticsearch__.index_document }

  just_define_datetime_picker :when, :add_to_attr_accessor => true
  validates :when, :presence => true

  def session_time
    self.when.strftime("%M%H").to_i*100
  end
end
