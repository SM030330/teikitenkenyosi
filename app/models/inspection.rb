class Inspection < ApplicationRecord
  belongs_to :user

  has_many   :items
  has_many   :categories_to_inspections
  has_many   :categories, through: :categories_to_inspections

  validates :name, presence: true
  validates :user_id, presernce: true
end
