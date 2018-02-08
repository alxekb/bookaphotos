class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations
  has_many :invoices
  has_many :photo_sessions

  has_and_belongs_to_many :langs

  has_attached_file :avatar, styles: { medium: "64x64#", thumb: "16x16#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def to_s
    email
  end
end
