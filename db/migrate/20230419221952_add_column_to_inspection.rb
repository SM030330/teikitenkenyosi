class AddColumnToInspection < ActiveRecord::Migration[6.1]
  def change
    add_column :inspections, :is_delete, :boolean, default: false
  end
end
