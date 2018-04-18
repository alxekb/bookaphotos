class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :locations
  has_many :invoices
  has_many :photo_sessions

  has_and_belongs_to_many :langs

  has_many :orders
  accepts_nested_attributes_for :profile

  after_create :create_profile

  enum role: {
    client: 0,
    photographer: 1
  }

  has_attached_file :avatar, styles: { medium: "64x64#", thumb: "16x16#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def photographer_upcoming_events
    orders.joins(photo_session: :session_days)
          .where('session_days.when >= ?', Date.current).count
  end

  def to_s
    email
  end
end
