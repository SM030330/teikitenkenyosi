class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories
  has_many :inspections
  has_many :items

  validates :name, presence: true

  
  validates :email, presence: true, 
                    uniqueness: true

  before_save :email_to_notice_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  private

  def email_to_notice_email
    self.notice_email = self.email if self.notice_email.blank?
  end
end
