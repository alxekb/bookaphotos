require 'elasticsearch/model'

class PhotoSession < ApplicationRecord
  include PhotoSessionSearchable
  include Elasticsearch::Model::Callbacks
  index_name "#{Rails.application.class.parent_name.downcase}_#{Rails.env.to_s.downcase}_#{name.pluralize.downcase}"
  after_touch() { __elasticsearch__.index_document }

  belongs_to :user

  scope :published, -> { where(published: true) }

  has_and_belongs_to_many :cities
  has_and_belongs_to_many :themes

  def self.touch
    update_all(updated_at: Time.now)
  end

end
