class Inspection < ApplicationRecord
  belongs_to :user

  has_many   :items
  has_many   :categories_to_inspections
  has_many   :categories, through: :categories_to_inspections

  validates :name, presence: true

  accepts_nested_attributes_for :items, allow_destroy: true 
end
