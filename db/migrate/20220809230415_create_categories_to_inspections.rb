class CreateCategoriesToInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_to_inspections do |t|
      t.timestamps
    end
  end
end
