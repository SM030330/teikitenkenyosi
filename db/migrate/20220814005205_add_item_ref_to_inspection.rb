class AddItemRefToInspection < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :inspection, null: false, foreign_key: true
  end
end
