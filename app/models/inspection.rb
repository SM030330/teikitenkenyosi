class Inspection < ApplicationRecord
  belongs_to :user

  has_many   :items, dependent: :destroy
  has_many   :categories_to_inspections, dependent: :destroy
  has_many   :categories, through: :categories_to_inspections, dependent: :destroy

  validates :name, presence: true

  scope :users_all, ->(user) { where(id: user.id) }
  scope :create_desc_of, ->(desc_num) { order(created_at: :desc_num) }

  accepts_nested_attributes_for :items, allow_destroy: true 

  def errors_add_api_auth
    errors.add(:base, "Googleアカウントの認証がまだされておりません。my configから認証を行ってください。")
  end
end
