class Category < ApplicationRecord
  has_many :categories_to_inspections
  has_many :inspections, through: :categories_to_inspections

  validates :name, presence: true
end
