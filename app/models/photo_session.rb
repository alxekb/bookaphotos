require 'elasticsearch/model'

class PhotoSession < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  include PhotoSessionSearchable
  index_name "#{Rails.application.class.parent_name.downcase}_#{Rails.env.to_s.downcase}_#{name.pluralize.downcase}"

  after_touch lambda { PhotoSession.__elasticsearch__.refresh_index! }

  belongs_to :user

  scope :published, -> { where(published: true) }

  has_and_belongs_to_many :cities
  has_and_belongs_to_many :themes

  has_many :covers, :dependent => :destroy
  accepts_nested_attributes_for :covers, allow_destroy: true, reject_if: ->(a) { a[:id].nil? && a[:photo].nil? }

  has_many :session_days, :dependent => :destroy

  accepts_nested_attributes_for :session_days, allow_destroy: true, reject_if: ->(a) { a[:id].nil? && a[:price].nil? }

  def self.touch
    update_all(updated_at: Time.now)
  end

end
