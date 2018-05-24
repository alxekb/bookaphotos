require "elasticsearch/model"

class PhotoSession < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  include PhotoSessionSearchable
  index_name "#{Rails.application.class.parent_name.downcase}_#{Rails.env.to_s.downcase}_#{name.pluralize.downcase}"

  after_touch lambda { PhotoSession.__elasticsearch__.refresh_index! }

  belongs_to :user
  belongs_to :currency

  scope :published, -> { where(published: true) }

  has_and_belongs_to_many :cities
  has_and_belongs_to_many :themes

  has_many :covers, dependent: :destroy
  accepts_nested_attributes_for :covers, allow_destroy: true, reject_if: ->(a) { a[:id].nil? && a[:photo].nil? }

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: ->(a) { a[:id].nil? && a[:photo].nil? }

  has_many :session_days, dependent: :destroy
  accepts_nested_attributes_for :session_days, allow_destroy: true, reject_if: ->(a) { a[:id].nil? && a[:price].nil? }

  has_many :options, class_name: "PhotoSession::Option", foreign_key: :photo_session_id
  accepts_nested_attributes_for :options

  enum session_type: {
    special: 0,
    express: 1
  }

  validates :title,
           :description,
           :user_id,
           :currency_id,
           :duration,
           :photos_count,
           :period_of_execution,
           :for_whom,
           :preparation,
           :what_to_take, presence: true
  validates :duration,
            :period_of_execution,
            :photos_count, numericality: { greater_than_or_equal_to: 1 }
  validates :published, inclusion: { in: [true, false] }
  validates :session_type, presence: true, inclusion: { in: PhotoSession.session_types.keys }

  def self.touch
    update_all(updated_at: Time.now)
  end
end
