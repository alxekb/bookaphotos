class User < ApplicationRecord
  include EmailValidateable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :locations
  has_many :invoices
  has_many :photo_sessions

  has_and_belongs_to_many :langs

  has_many :orders, class_name: "Order", foreign_key: "photographer_id"
  has_many :bookings, class_name: "Order", foreign_key: "client_id"
  accepts_nested_attributes_for :profile

  after_create :create_profile

  enum role: {
    client: 0,
    photographer: 1
  }
  delegate :first_name, :last_name, :phone, :avatar, to: :profile

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            email: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :role,
            presence: true,
            inclusion: { in: User.roles }
end
