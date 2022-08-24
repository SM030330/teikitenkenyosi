class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories
  has_many :inspections

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :notice_email, presence: true

  before_create :email_to_notice_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_to_notice_email
    notice_email = email if notice_email.present?
  end
end
