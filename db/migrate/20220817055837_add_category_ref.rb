class AddCategoryRef < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :user, null: false, foreign_key: true
  end
end
