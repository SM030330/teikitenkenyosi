class AddItemRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :user, null: false, foreign_key: true
  end
end
