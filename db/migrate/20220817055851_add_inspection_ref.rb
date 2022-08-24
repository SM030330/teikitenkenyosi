class AddInspectionRef < ActiveRecord::Migration[6.1]
  def change
    add_reference :inspections, :user, null: false, foreign_key: true
  end
end
