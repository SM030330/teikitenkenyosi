class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories
  has_many :inspections

  validates :name, presence: true

  
  validates :email, presence: true, 
                    uniqueness: true

  before_save :email_to_notice_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def email_to_notice_email
    self.notice_email = self.email if self.notice_email.blank?
  end
end
