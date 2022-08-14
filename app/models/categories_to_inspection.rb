class CategoriesToInspection < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :inspection, optional: true
end
