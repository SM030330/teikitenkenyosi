class AddCategoriesToInspectionRef < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories_to_inspections, :category, null: false, foreign_key: true
    add_reference :categories_to_inspections, :inspection, null: false, foreign_key: true
  end
end
