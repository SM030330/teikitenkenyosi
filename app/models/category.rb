class Category < ApplicationRecord
  belongs_to :user
  has_many   :categories_to_inspections
  has_many   :inspections, through: :categories_to_inspections

  validates :name, presence: true
  validates :user_id, presence: true
end
